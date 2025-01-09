section .data

section .text
        global main
main:
    mov rbp, rsp    ; save stack pointer for debugger
    nop
    
    ; Put code between two nops ....
        mov   rax, 7FFFFFFFFFFFFFFFh
        add   rax, 1                    ;unsigned so the next value will be negative
    nop
        
        xor   rax,rax
        mov   rax,90
        neg   rax                       ;another way converting value to negative
     nop
        
        xor   rax,rax
        mov   ax,-42
        mov   ebx,eax                   ;this will fail because bit stored at ax(16-bit) is moved to 32-bit, which the MSB not interpreted as sign value
        xor   ax,ax
        mov   ax,-42
        movsx rbx,ax                    ;sign extension operation
    nop
    ; Put code between two nops ....    

section .bss