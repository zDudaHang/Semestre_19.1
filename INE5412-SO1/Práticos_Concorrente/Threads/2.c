#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

void * PrintTID(void *arg) {
	pthread_t tid = pthread_self();
	printf("TID = %lu\n", tid);
	pthread_exit(0);
}

int main(int argc, char **argv) {
	if (argc < 2) {
		printf("Faltaram argumentos");
	} else {
		int num_threads = atoi(argv[1]);
		pthread_t threads[num_threads];
		for (int i = 0; i < num_threads; i++) {
			pthread_create(&threads[i], NULL, PrintTID, NULL);
		}
		for (int i = 0; i < num_threads; i++) {
			pthread_join(threads[i], NULL);
		}
		return 0;
	}

}