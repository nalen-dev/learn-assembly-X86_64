section .data
    Snippet db "MORNING"

section .text
    global main
main:
        mov rbx, Snippet
        mov rax, 7
DoMore: add byte [rbx], 32
        inc rbx
        dec rax
        jnz DoMore
    
    nop

section .bss