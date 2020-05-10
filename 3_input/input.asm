section .data
    helloStr db "Hello, world", 10
    hiStr db "Hi, "

section .bss            ; section "Block Started by Symbol"
    name resb 10        ; allocating 10 bytes of memory and referring it as data char x[10]

section .text
    global _start

_start:
    call _printHelloWorld
    call _getName
    call _printHi
    call _printName
    call _exit

_exit:
    mov rax, 60         
    mov rdi, 0          
    syscall
    ret

_printHelloWorld:
    mov rax, 1          ; load the syscall id sys_write
    mov rdi, 1          ; load the file descriptor as first parameter
    mov rsi, helloStr   ; load helloStr as second parameter
    mov rdx, 13         ; load the size of string as third parameter
    syscall
    ret

_getName:
    mov rax, 0  ; load syscall of sys_read
    mov rdi, 0  ; sys_in
    mov rsi, name
    mov rdx, 10
    syscall
    ret

_printHi:
    mov rax, 1
    mov rdi, 1
    mov rsi, hiStr
    mov rdx, 4
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 9
    syscall
    ret