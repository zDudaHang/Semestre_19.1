#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <string.h>

int main(int agrc, char **argv) {
	for (int i = 0; i < 2; i++) {
		pid_t pid = fork();
		// Pai
		if(pid > 0) {
			printf("Processo pai %d criou %d\n", getpid(), pid);
			fflush(stdout);
		// Filho
		} else {
			for (int i = 0; i < 2; i++) {
				pid_t pid2 = fork();
				// Pai
				if (pid2 > 0){
					printf("Processo pai %d criou %d\n", getpid(), pid);
					fflush(stdout);
				// Filho
				} else {
					printf("Processo %d filho de %d\n", getpid(), getppid());
					fflush(stdout);
					break;
				}
			}
			break;
		}
	}

	while(wait(NULL)>0);
	return 0;
}