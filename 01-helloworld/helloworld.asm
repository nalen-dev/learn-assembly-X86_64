; Executable name   : helloworld
; Version           : 1.0
; Author            : Nalendra Praja
; Architecture      : x86_64

; Build using this command :
; nasm -f elf64 -g -F stabs helloworld.asm ld -0 helloworld helloworld.o

SECTION     .data           ; Section containing initialized data
    EatMsg: db  "Hello World!",10
    EatLen: equ $-EatMsg
SECTION     .bss            ; Section containing uninitialized data
SECTION     .text           ; Section containing code
global      _start          ; Entry point for linker!
start:                         
    mov     rbp,    rsp     ; for correct debugging
    nop
    mov     rax,    1       ; 1 = sys_write for syscall
    mov     rdi,    1       ; 1 = fd for stdout; i.e., write to the terminal window
    mov     rsi,    EatMsg  ; Put address of msg string in rsi
    mov     rdx,    EatLen  ; Length of string to be written in rdx
    syscall                 ; Make the system call
    mov     rax,    60      ; 60 = exit the program
    mov     rdi,    0       ; Return value in rdi 0 = nothing to return
    syscall                 ; Call syscall to exit
