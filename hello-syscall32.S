.data
msg1:
    .ascii "Hello from int 0x80!\n"
    len1 = . - msg1
msg2:
    .ascii "Hello from sysenter!\n"
    len2 = . - msg2

.text
    .globl _start

_start:
    movl $4,    %eax
    movl $1,    %ebx
    movl $msg1, %ecx
    movl $len1, %edx
    int  $0x80


    movl $4,    %eax
    movl $1,    %ebx
    movl $msg2, %ecx
    movl $len2, %edx
    call sys
 

    movl $1, %eax
    movl $0, %ebx
    int $0x80

sys:
    pushl %ecx
    pushl %edx
    pushl %ebp
    movl %esp, %ebp
    sysenter
    popl %ebp
    popl %edx
    popl %ecx
    ret
