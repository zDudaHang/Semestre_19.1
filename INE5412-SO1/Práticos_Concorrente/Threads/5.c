#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>

int contador_global = 0;
sem_t semaphore;

void * Incrementar(void *arg) {
	sem_wait(&semaphore);
	for(int i = 0; i < 100; i++) {
		contador_global++;
	}
	sem_post(&semaphore);
	pthread_exit(0);
}

int main(int argc, char **argv) {
	if (argc < 2) {
		printf("Faltaram argumentos");
	} else {
		int num_threads = atoi(argv[1]);
		pthread_t threads[num_threads];
		sem_init(&semaphore, 0, 1);
		for (int i = 0; i < num_threads; i++) {
			pthread_create(&threads[i], NULL, Incrementar, NULL);
		}
		for (int i = 0; i < num_threads; i++) {
			pthread_join(threads[i], NULL);
		}
		sem_destroy(&semaphore);
		printf("Contador global = %d\n", contador_global);
		return 0;
	}

}