section .data

section .text
        global main
main:
    mov rbp, rsp    ; save stack pointer for debugger
    ; Put code between two nops ....
    nop

    nop    
    ; Put code between two nops ....    

section .bss