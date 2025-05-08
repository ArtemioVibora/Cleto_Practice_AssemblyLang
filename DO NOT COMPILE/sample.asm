section .data
    msg db "Sample program", 0 
    newline db 10
    num_buffer ;Buffer to store the string representation of the number 

_start

    ;Addition
    mov eax, 1
    mov ebx, 3
    add eax, ebx
    ;output = 4
    
    ;Subtraction
    mov eax, 3
    mov ebx, 1
    sub eax, ebx
    ;output = 2

    ;Multiplication
    mov eax, 10
    mov ebx, 2
    mul ebx
    ;output = 20

;Note do not compile
