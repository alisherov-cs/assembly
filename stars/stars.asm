section .data
    msg db "displays 5 stars"
    len equ $ - msg
    stars times 5 db "*"

section .text
    global _start

_start:
    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 5
    mov ecx, stars
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80
