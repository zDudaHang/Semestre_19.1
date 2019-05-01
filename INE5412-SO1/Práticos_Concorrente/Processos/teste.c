#include <sys/mman.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main(void) {
    int * shared = mmap(NULL, sizeof(int), PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0); 
    pid_t child;
    int childstate;
    printf("%d\n", *shared);
    child = fork();
    if(child==0){
            *shared = 1;
            printf("%d\n", *shared);
    }
    waitpid (child, &childstate, 0); 
    printf("%d\n",*shared);
    return 0;
}