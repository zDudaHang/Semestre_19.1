#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

int contador_global = 0;
pthread_mutex_t mutex;

void * Incrementar(void *arg) {
	pthread_mutex_lock(&mutex);
	for(int i = 0; i < 100; i++) {
		contador_global++;
	}
	pthread_mutex_unlock(&mutex);
	pthread_exit(0);
}

int main(int argc, char **argv) {
	if (argc < 2) {
		printf("Faltaram argumentos");
	} else {
		int num_threads = atoi(argv[1]);
		pthread_t threads[num_threads];
		pthread_mutex_init(&mutex, NULL);
		for (int i = 0; i < num_threads; i++) {
			pthread_create(&threads[i], NULL, Incrementar, NULL);
		}
		for (int i = 0; i < num_threads; i++) {
			pthread_join(threads[i], NULL);
		}
		pthread_mutex_destroy(&mutex);
		printf("Contador global = %d\n", contador_global);
		return 0;
	}

}