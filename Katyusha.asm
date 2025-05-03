section .txt

    global _start     ;must be delcared for linker or ld Alright

_start:
    mov edx, len      ; message length
    mov ecx, msg      ; message to write
    mov ebx, 1        ; file descriptor stdout hmm interesting
    mov eax, 4        ; system call number (system write)
    int 0x80          ; call kernel

    mov eax, 1        ; system call number
    int 0x80          ; call kernel


section .data

msg db 'Katyusha Rockets firing', 0xa    ;String
len equ $ - msg ;len
