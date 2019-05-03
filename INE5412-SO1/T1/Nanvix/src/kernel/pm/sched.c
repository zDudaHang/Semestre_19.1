/*
 * Copyright(C) 2011-2016 Pedro H. Penna   <pedrohenriquepenna@gmail.com>
 *              2015-2016 Davidson Francis <davidsondfgl@hotmail.com>
 *
 * This file is part of Nanvix.
 *
 * Nanvix is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Nanvix is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Nanvix. If not, see <http://www.gnu.org/licenses/>.
 */

#include <nanvix/clock.h>
#include <nanvix/const.h>
#include <nanvix/hal.h>
#include <nanvix/pm.h>
#include <signal.h>

// -------------------------------------------------------------------------- MODIFICACOES - CFS

static const unsigned control_increment[8] = {8, 7, 6, 5, 4, 3, 2, 1};

static const unsigned nice_to_weight[40] = {
 /* 0 */     88761,     71755,     56483,     46273,     36291,
 /* 5 */     29154,     23254,     18705,     14949,     11916,
 /* 10 */      9548,      7620,      6100,      4904,      3906,
 /* 15 */      3121,      2501,      1991,      1586,      1277,
 /* 20 */      1024,       820,       655,       526,       423,
 /* 25 */       335,       272,       215,       172,       137,
 /* 30 */       110,        87,        70,        56,        45,
 /* 35 */        36,        29,        23,        18,        15,
};

EXTERN unsigned find_min_vruntime(void) {

	unsigned min_vruntime = ULONG_MAX;

	struct process *p;

	for (p = FIRST_PROC; p <= LAST_PROC; p++)
	{
		if (p->state != PROC_READY)
			continue;

		if (p->vruntime < min_vruntime)
		{
			min_vruntime = p->vruntime;
		}
	}
	return min_vruntime;
}

EXTERN unsigned prio_to_control_increment(int prio) {
	unsigned index = (prio + 100)/20;
	return control_increment[index];
}


EXTERN unsigned sum_weights(void) {
	unsigned sum = 0;

	struct process *p;

	for (p = FIRST_PROC; p <= LAST_PROC; p++) {
		if (p->state == PROC_READY) {
			sum += nice_to_weight[p->nice];
		}
	}
	return sum;
}

EXTERN unsigned count_ready_tasks(void) {
	unsigned sum = 0;

	struct process *p;

	for (p = FIRST_PROC; p <= LAST_PROC; p++) {
		if(p->state == PROC_READY) {
			sum++;
		}
	}
	return sum;
}

EXTERN unsigned sched_period(void) {
	unsigned sched_period = SCHED_LATENCY;

	unsigned sched_nr = SCHED_LATENCY/SCHED_MIN_GRANULARITY;

	unsigned sched_nr_ready = count_ready_tasks();

	if (sched_nr_ready > sched_nr) {
		sched_period = SCHED_MIN_GRANULARITY * (sched_nr_ready+1);
	}
	return sched_period;
}

EXTERN unsigned sched_time_slice(struct process*curr) {

	unsigned period = sched_period();

	unsigned curr_weight = nice_to_weight[curr->nice];

	unsigned sum = sum_weights() + curr_weight;

	unsigned slice = SCHED_MIN_GRANULARITY;

	if (sum > curr_weight) {
		unsigned ratio = curr_weight/sum;
		slice += period*ratio;
	}	
	return slice;
}

// -------------------------------------------------------------------------- MODIFICACOES - CFS

/**
 * @brief Schedules a process to execution.
 * 
 * @param proc Process to be scheduled.
 */
PUBLIC void sched(struct process *proc)
{
	proc->state = PROC_READY;
}

/**
 * @brief Stops the current running process.
 */
PUBLIC void stop(void)
{
	curr_proc->state = PROC_STOPPED;
	sndsig(curr_proc->father, SIGCHLD);
	yield();
}

/**
 * @brief Resumes a process.
 * 
 * @param proc Process to be resumed.
 * 
 * @note The process must stopped to be resumed.
 */
PUBLIC void resume(struct process *proc)
{	
	/* Resume only if process has stopped. */
	if (proc->state == PROC_STOPPED)
		sched(proc);
}

/**
 * @brief Yields the processor.
 */
PUBLIC void yield(void)
{
	struct process *p;    /* Working process.     */
	struct process *next; /* Next process to run. */

	/* Re-schedule process for execution. */
	if (curr_proc->state == PROC_RUNNING)
		sched(curr_proc);

	/* Remember this process. */
	last_proc = curr_proc;

	// Solucao do problema do next->priority = PRIO_USER;
	curr_proc->priority = PRIO_USER;

	/* Check alarm. */
	for (p = FIRST_PROC; p <= LAST_PROC; p++)
	{
		/* Skip invalid processes. */
		if (!IS_VALID(p))
			continue;
		
		/* Alarm has expired. */
		if ((p->alarm) && (p->alarm < ticks))
			p->alarm = 0, sndsig(p, SIGALRM);
	}

	/* Choose a process to run next. */
	next = IDLE;

	// -------------------------------------------------------------------------- MODIFICACOES - CFS

	unsigned min_vruntime = ULONG_MAX;
	for (p = FIRST_PROC; p <= LAST_PROC; p++)
	{
		/* Skip non-ready process and IDLE. */
		if (p->state != PROC_READY)
			continue;

		if (p->vruntime <= min_vruntime)
		{
			min_vruntime = p->vruntime;
			next = p;
		}
	}

	// PROBLEMA !
	/*next->priority = PRIO_USER;*/ 
	next->state = PROC_RUNNING;

	next->control_counter = 0;
	next->time_slice_counter = 0;

	// -------------------------------------------------------------------------- MODIFICACOES - CFS

	switch_to(next);
}
