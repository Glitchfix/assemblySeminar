%include "6_macros/include.inc"

STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

section .data
    helloStr db "Hello, world!", 10, 0
    digit db 0,10

section .text
    global _start


;%macro [name] [argc]
;%%local labels
;    ...
;    definition
;    ...
;%endmacro
%macro exit 0
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall
%endmacro

%macro printDigit 1
    mov rax, %1
    call _printRAXDigit
%endmacro

%macro printDigitSum 2
    mov rax, %1
    add rax, %2
    call _printRAXDigit
%endmacro

_start:
    printDigit 8
    printDigitSum 2, 3
    print helloStr
    exit

_printRAXDigit:
    add rax, 48         ; load 48 into the register
    mov [digit], al     ; the lower byte of rax gets loaded into digit *
    mov rax, SYS_WRITE
    mov rdi, SYS_WRITE
    mov rsi, digit
    mov rdx, 2
    syscall
    ret