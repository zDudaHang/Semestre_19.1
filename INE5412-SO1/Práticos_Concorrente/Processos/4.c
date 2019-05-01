#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <string.h>

#include <time.h>

int main(int agrc, char **argv) {
	if (agrc == 2) {
		int procs = atoi(argv[1]);
		printf("Procs = %d\n", procs);
		for (int i = 0; i < procs; i++) {
			fflush(stdout);
			pid_t pid = fork();
			// Pai
			if (pid > 0) {
				printf("Processo pai %d criou %d\n", getpid(), pid);
				fflush(stdout);
				//while(wait(NULL)>0);
			} else {
				srand(time(NULL));
				int time = rand() % 10;
				sleep(time);
				printf("Processo %d criado\n", getpid());
				fflush(stdout);
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