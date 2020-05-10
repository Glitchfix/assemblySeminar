section .data
    helloStr db "Hello, World!",10,0

section .text
    global _start


_start:
    mov rax, helloStr
    call _print

    call _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ret

_print:
    push rax            ; push rax onto the stack
    mov rbx, 0          ; count the length of string
_printLoop:
    inc rax             ; increment the rax register i.e. move to the next char
    inc rbx             ; increment the length seeked
    mov cl, [rax]       ; move [rax] to cl (8bit equivalent of rcx)
    cmp cl, 0           ; compare to see if reached end i.e. 0 in this case
    jne _printLoop      ; jump if not equals
    
    mov rax, 1          ; load the syscall id sys_write
    mov rdi, 1          ; load the file descriptor as first parameter
    pop rsi             ; pop rax to rsi
    mov rdx, rbx        ; move the calculated length to rdx
    syscall

    ret