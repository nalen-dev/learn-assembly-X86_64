section .data
section .text
    global main
main:

    mov rbp, rsp
    nop

    xor rdx,rdx     ;rdx must be cleared first for div opeartion
    mov rax,250     ;dividen
    mov rbx,5       ;divisor
    div rbx         ;do the DIV
    
    nop
    
    mov eax, 447    ;product is fit in the first register, so the high-order regsiter will zeroed out
    mov ebx, 1739
    mul ebx
    
    xor eax, eax
    xor ebx, ebx
    
    mov eax,0FFFFFFFFh  ;overflow caused by this operation, look at the flags and the high-order register 
    mov ebx,03B72h      ;edx:eax
    mul ebx


    

    nop    
    ; Put code between two nops ....    

section .bss