#adding a system call to kernel
apt-get build-dep linux // builds dependency tree before getting source
apt-get source linux // gets current kernel source – git version or use wget
/linux4.2.5- kernel folder is where we add syscalls
cd /usr/src/linux-4.2.5
Edit arch/x86/entry/syscalls/syscall_32.tbl to add your own system call entry
<last-number+1> i386 <yourname> sys_<yourname>
Eg- 359 i386 jayprakash sys_jayprakash
Edit include/linux/syscalls.h-
	asmlinkage int sys_jayprakash(int num1, int num2);
(mkdir) kernel/jayprakash/
vi sys_jayprakash.c
	/* sys_jayprakash.c */
	#include<linux/kernel.h>
	#include<linux/syscalls.h>
	asmlinkage int sys_jayprakash(int num1, int num2)
	{
	return num1+num2;
	}
vi Makefile
	obj-y := sys_jayprakash.o
Edit kernel/Makefile to include kernel/jayprakash/ directory
	Right below obj-y +=power/, to add the following line obj-y += jayprakash/
#compile and build kernel
cd /usr/src/linux-4.2.5
make clean # clean compiled object
 make mrproper # clean config file
 make menuconfig # generate config file
 make localmodconfig # generate module config
 make -j2 # compile kernel
 make modules_install install # kernel installation
 update-grub # Update grub start menu - optional
#reboot to new kernel and test
	mkdir testing
	vi jayprakash.h
		#include <linux/unistd.h>
		int jayprakash(int num1, int num2) { //yourname as given before
		return syscall(syscallNO, num1, num2); //syscallNO=359
		}
	vi testsyscalls.c
		#include <stdio.h>
		#include "jayprakash.h"
		int main() {
		printf("The kernel system call returns %d\n", jayprakash(10, 20));
		}
	