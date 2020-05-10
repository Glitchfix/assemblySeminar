section .data
    helloStr db "Hello, world", 10

section .text           ; .text section keeps the actual code. Tells the kernel where the execution begins
    global _start

_start:
    mov rax, 1          ; load the syscall id sys_write
    mov rdi, 1          ; load the file descriptor as first parameter
    mov rsi, helloStr   ; load helloStr as second parameter
    mov rdx, 13         ; load the size of string as third parameter
    syscall

    mov rax, 60         ; load the syscall id for sys_exit
    mov rdi, 0          ; load the exit code parameter
    syscall