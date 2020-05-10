%macro print 1
    mov rax, %1
    mov rbx, 0
%%printLoop:
    mov cl, [rax]
    cmp cl, 0
    je %%endPrintLoop
    inc rbx
    inc rax
    jmp %%printLoop
%%endPrintLoop:
    mov rax, SYS_WRITE
    mov rdi, STDIN
    mov rsi, %1
    mov rdx, rbx
    syscall
%endmacro