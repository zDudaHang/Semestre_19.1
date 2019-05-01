#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

int contador_global = 0;

void * Incrementar(void *arg) {
	for(int i = 0; i < 100; i++) {
		contador_global++;
	}
	pthread_exit(0);
}

int main(int argc, char **argv) {
	if (argc < 2) {
		printf("Faltaram argumentos");
	} else {
		int num_threads = atoi(argv[1]);
		pthread_t threads[num_threads];
		for (int i = 0; i < num_threads; i++) {
			pthread_create(&threads[i], NULL, Incrementar, NULL);
		}
		for (int i = 0; i < num_threads; i++) {
			pthread_join(threads[i], NULL);
		}
		printf("Contador global = %d\n", contador_global);
		return 0;
	}

}