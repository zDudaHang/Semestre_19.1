#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <string.h>

int main(int agrc, char **argv) {
	for (int i = 0; i < 4; i++) {
		pid_t pid = fork();
		// Pai
		if(pid > 0) {
			printf("Processo pai %d criou %d\n", getpid(), pid);
		// Filho
		} else {
			printf("Processo filho %d || Pai: %d\n", getpid(), getppid());
			break;
		}
	}
}