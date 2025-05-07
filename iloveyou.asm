section .data
   message db "I love hotdogs", 14 ; Okay so db is define byte

section .text
    global _start ;global is a keyword which makes the label _start visible to the linker
                  ;while _start is the entry point of the program

_start:
    mov eax, 4 ;Okay something interesting, if it is a number 4, it is telling it to perform to write
               ;mov is just to mov or copy the data from one location to another
    mov ebx, 1 ;stdout.... hmmm interesting. ebx to pass the file descriptor
    mov ecx, message ;ecx Address of the string to print le message
    mov edx, 14 ;Another new line

    int 80h ; System call


    mov eax, 1
    xor ebx, ebx
    int 80h
