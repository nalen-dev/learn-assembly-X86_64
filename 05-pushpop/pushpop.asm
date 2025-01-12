section .data
    Quad: dq 'KANGAROO'
    
section .text
        global main
main:
    mov rbp, rsp    ; save stack pointer for debugger
    ; Put code between two nops ....
    nop
    
    xor rax,rax     ;zeroed our all the 64-bits register, so there is no value hanging in high bit
    xor rbx,rbx
    xor rcx,rcx
    xor rdx,rdx
    
    mov ax,01234h   ;place values in ax,bx,cx
    mov bx,04ba7h
    mov cx,0ff17h
        
    push ax         ;Push values onto the stack
    push bx
    push cx
    
    pop word dx
    
    xor rbx,rbx
    pushfq          ;push the RFlags register onto the stack
    pop qword rbx   ;pop it to the rbx
    
    pop bx          ;cleared the stack by put the value back in the same register
    pop ax          ;avoid segmentation fault
    
    nop    
    ; Put code between two nops ....    

section .bss