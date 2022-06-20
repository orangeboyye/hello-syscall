

APP := hello hello-syscall32 hello-syscall64
OBJS := test.o rbutils.o rbtree.o queue.o

all : $(APP)

hello : hello.c
	gcc -o hello hello.c


hello-syscall32 : hello-syscall32.S
	gcc -m32 -c -o hello-syscall32.o hello-syscall32.S
	ld -melf_i386 -entry _start hello-syscall32.o -o hello-syscall32

hello-syscall64 : hello-syscall64.S
	gcc -c -o hello-syscall64.o hello-syscall64.S
	ld -entry _start hello-syscall64.o -o hello-syscall64



run : $(APP)
	./hello
	./hello-syscall32
	./hello-syscall64




.PHONY :
clean:
	-rm -f *.o hello hello-syscall32 hello-syscall64