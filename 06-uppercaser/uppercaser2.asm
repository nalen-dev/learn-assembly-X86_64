;   Run it this way in a terminal window:
;   uppercaser2 > (output file) < (input file)
;   Build in SASM using the default make lines and x64 checked


SECTION .bss             ; Section containing uninitialized data
    BUFFLEN equ  128     ; Length of buffer
    Buff:   resb BUFFLEN ; Text buffer itself

SECTION .data            ; Section containing initialised data
SECTION .text            ; Section containing code

global main              ; Linker needs this to find the entry point
main:
    mov rbp,rsp          ; for correct debugging

; Read a buffer full of text from stdin:
Read:
    mov rax, 0          ; Specify sys_read call
    mov rdi, 0          ; Specify File Descriptor 0: Standard Input
    mov rsi, Buff       ; Pass offset of the buffer to read to
    mov rdx, BUFFLEN    ; Pass number of bytes to read at one pass
    syscall             ; Call sys_read to fill the buffer
    mov r12, rax        ; Copy sys_read return value to r12 for later
    cmp rax, 0          ; If rax=0, sys_read reached EOF on stdin
    je Done             ; Jump If Equal (to 0, from compare)

; Set up the registers for the process buffer step:
    mov rbx, rax        ; Place the number of bytes read into rbx
    mov r13, Buff       ; Place address of buffer into r13
    dec r13             ; Adjust count to offset

; Go through the buffer and convert lowercase to uppercase characters:
Scan:
    cmp byte [r13+rbx],61h  ; Test input char against lowercase 'a'
    jb .Next                ; If below 'a' in ASCII, not lowercase

    cmp byte [r13+rbx],7Ah  ; Test input char against lowercase 'z'
    ja .Next                ; If above 'z' in ASCII, not lowercase
                            ; At this point, we have a lowercase char
    sub byte [r13+rbx],20h  ; Subtract 20h to give uppercase...

.Next:
    dec rbx                 ; Decrement counter

    cmp rbx,0               ; If characters remain, loop back
    jnz Scan                ; Write the buffer full of processed text to stdout:

Write:
    mov rax,1               ; Specify sys_write call
    mov rdi,1               ; Specify File Descriptor 1: Standard output
    mov rsi,Buff            ; Pass offset of the buffer
    mov rdx,r12             ; Pass # of bytes of data in the buffer
    syscall                 ; Make kernel call
    jmp Read                ; Loop back and load another buffer full

; All done! Let's end this party:
Done:
    ret

