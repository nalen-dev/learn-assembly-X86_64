section .bss 
    Buff resb 1

section .data
    
section .text
global main
    
main:
    mov rbp, rsp    ; for correct debugging

Read:
    mov rax, 0      ; Specify sys_read call
    mov rdi, 0      ; Specify File Descriptor 0: Standard Input
    mov rsi, Buff   ; Pass address of the buffer to read to
    mov rdx, 1      ; Tell sys_read to read one char from std_in
    syscall         ; Call sys_read

