#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <string.h>

#include <fcntl.h>
#include <sys/stat.h>
#include <time.h>
#include <sys/mman.h>
#include <semaphore.h>

#define SEM_NAME "/semaforo"
#define SEM_PERMS (S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP)
/*
* S_IRUSR = Permits the creator of the named semaphore to open the semaphore in read mode.
* S_IWUSR = Permits the creator of the named semaphore to open the semaphore in write mode.
* S_IRGRP = Permits the group associated with the named semaphore to open the semaphore in read mode.
* S_IWGRP = Permits the group associated with the named semaphore to open the semaphore in write mode.
*/
#define INITIAL_VALUE 1

int main(int agrc, char **argv) {
	if (agrc == 2) {

		int * shared = mmap(NULL, sizeof(int), PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0); 

		int id = 1;

		// Inicializando o semaforo compartilhado
		sem_t * semaforo = sem_open(SEM_NAME, O_CREAT | O_EXCL, SEM_PERMS, INITIAL_VALUE);

		// Colocando o valor no inteiro compartilhado

		*shared = id;

		int procs = atoi(argv[1]);

		for (int i = 0; i < procs; i++) {
			fflush(stdout);
			pid_t pid = fork();
			// Pai
			if (pid > 0) {
				printf("Processo pai %d criou %d\n", getpid(), pid);
				fflush(stdout);

				// O pai não vai usar o semaforo
				//sem_close(semaforo);
				//sem_unlink(SEM_NAME);

			} else {
				// O processo filho abre o semaforo compartilhado pelo nome
				sem_t * semaforo = sem_open(SEM_NAME, O_RDWR);

				srand(time(NULL));
				int time = rand() % 10;
				sleep(time);

				int id_local = -1;

				// Regiao critica
				sem_wait(semaforo);
				id_local = *shared;
				(*shared)++;
				sem_post(semaforo);
				// Regiao critica

				printf("Processo %d criado\n", id_local);

				fflush(stdout);

				sem_unlink(SEM_NAME);

				sem_close(semaforo);

				break;
			}
		}
		while(wait(NULL)>0);
	} else {
		printf("Faltaram argumentos.\n");
		return 1;
	}

	return 0;
}