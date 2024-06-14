section .data
    inMsg db "Enter your age: ", 0
    lenInMsg equ $ - inMsg
    outMsg db "You are ", 0
    lenOutMsg equ $ - outMsg
    child db "Child", 0
    lenChild equ $ - child
    teenager db "Teenager", 0
    lenTeenager equ $ - teenager
    adult db "Adult", 0
    lenAdult equ $ - adult
    teenagerAge db 18

section .bss
    age resb 5
    age_int resb 1

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, inMsg
    mov edx, lenInMsg
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, age
    mov edx, 5
    int 0x80

    mov ecx, age
    call str_to_int
    mov [age_int], al

    mov eax, 4
    mov ebx, 1
    mov ecx, outMsg
    mov edx, lenOutMsg
    int 0x80

    mov al, [teenagerAge]
    mov bl, [age_int]

    cmp bl, al
    je teenager_label
    jl child_label
    jg adult_label

child_label:
    mov eax, 4
    mov ebx, 1
    mov ecx, child
    mov edx, lenChild
    int 0x80
    jmp done

teenager_label:
    mov eax, 4
    mov ebx, 1
    mov ecx, teenager
    mov edx, lenTeenager
    int 0x80
    jmp done

adult_label:
    mov eax, 4
    mov ebx, 1
    mov ecx, adult
    mov edx, lenAdult
    int 0x80

done:
    mov eax, 1
    int 0x80

str_to_int:
    xor eax, eax
    xor ebx, ebx
    mov bl, byte [ecx]
    sub bl, '0'

next_digit:
    cmp bl, 9
    ja done_convert
    mul byte [ten]
    add al, bl   
    inc ecx     
    mov bl, byte [ecx]
    sub bl, '0'
    jmp next_digit

done_convert:
    ret

section .data
    ten db 10
