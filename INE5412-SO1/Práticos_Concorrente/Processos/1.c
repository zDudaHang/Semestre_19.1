#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <string.h>

int main(int agrc, char **argv) {
	pid_t pid = fork();
	printf("Novo processo criado!\n");
}