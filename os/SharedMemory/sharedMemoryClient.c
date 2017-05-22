#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
void main() {
int shm_id;
key_t mem_key;
int *shm_ptr;
mem_key = ftok(".", 'a');
shm_id = shmget(mem_key, 4*sizeof(int), 0666);
if (shm_id < 0) {
printf("*** shmget error (client) ***\n");
exit(1);
}
shm_ptr = (int *) shmat(shm_id, NULL, 0);
if (shm_ptr == (int *)-1) { /* attach */
printf("*** shmat error (client) ***\n");
exit(1);
}
shmdt(shm_ptr);
shmctl(shm_id, IPC_RMID, NULL);
}
