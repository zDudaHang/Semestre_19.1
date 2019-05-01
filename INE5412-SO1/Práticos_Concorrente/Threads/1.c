#include <pthread.h>
#include <stdio.h>

void * PrintTID(void *arg) {
	pthread_t tid = pthread_self();
	printf("TID = %lu\n", tid);
	pthread_exit(0);
}

int main(int argc, char **argv) {
	pthread_t thread;
	//pthread_create (thread, attr, start_routina, arg)
	pthread_create(&thread, NULL, PrintTID, NULL);
	pthread_join(thread, NULL);
	return 0;
}