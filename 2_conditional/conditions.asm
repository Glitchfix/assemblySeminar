section .data
    big db "I am biggg", 10
    small db "I am small", 10

section .text
    global _start

_start:
    mov rbx, 100     ; load register rbx with 10
    mov r9, 20      ; load register r9 with 20

    cmp rbx, r9     ; compare the data in rbx with r9
    jl _smalljump   ; jump to _smalljump tag if data in rbx < r9
    mov rsi, big
_backtofuture:
    call _printStr  ; call a subroutine
    
    mov rax, 60
    mov rdi, 0
    syscall

_smalljump:
    mov rsi, small
    jmp _backtofuture


_printStr:          ; call ends with ret
    mov rax, 1
    mov rdi, 1
    mov rdx, 11
    syscall
    ret             ; call ends with ret which is referred as return function