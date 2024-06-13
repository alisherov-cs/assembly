section .data
    inMsg db "Enter a number: "
    lenInMsg equ $ - inMsg
    outMsg db "You have entered: "
    lenOutMsg equ $ - outMsg

section .bss
    num resb 5

section .text
    global _start

_start: 
    mov eax, 4
    mov ebx, 1
    mov ecx, inMsg
    mov edx, lenInMsg
    int 80h

    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, outMsg
    mov edx, lenOutMsg
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 80h

    mov eax, 1
    mov ebx, 1
    int 80h
