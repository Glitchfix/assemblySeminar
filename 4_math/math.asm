section .data
    digit db 0, 10

section .text
    global _start

_start:
    mov rax, 6              ; load 6 to rax
    call _printRAXDigit     ; print digit in rax
    mov rax, 6              ; load 6 to rax
    mov rbx, 2              ; load 2 to rbx
    add rax, rbx            ; divide rax with rbx
    call _printRAXDigit     ; print divided value in rax
    

    push 1                  ; push value 1 onto stack 
    push 2                  ; push value 2 onto stack
    push 3                  ; push value 3 onto stack
    pop rax                 ; pop value of top of stack onto rax
    call _printRAXDigit     ; printStackTop
    pop rax
    call _printRAXDigit
    pop rax
    call _printRAXDigit
    
    call _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
    ret

_printRAXDigit:
    add rax, 48         ; load 48 into the register
    mov [digit], al     ; the lower byte of rax gets loaded into digit *
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret