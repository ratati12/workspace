section .data
ln db 0xA
section .bss
i resb 4
x resb 4
y resb 4
z resb 4
v resb 4
section .text:
global _start
_start:
mov eax, 3
mov ebx, 1
mov ecx, i
mov edx, 4
int 0x80

mov eax, [i]
mov [x], ah
mov [y], al
rol eax, 16
mov [z], ah
mov [v], al
mov eax, 0
mov ax, [y]
cmp ax, 0x40
jg p1
jl p2

p1:
sub ax, 0x31
mov bl, 2
div bl
mov [y], al
add ah, 0x30
mov [i], ah
mov eax, 4
mov ebx, 1
mov ecx, i
mov edx, 1
int 0x80

mov ax, [y]
mov bl, 2
div bl
mov [y], al
add ah, 0x30
mov [i], ah
mov eax, 4
mov ebx, 1
mov ecx, i
mov edx, 1
int 0x80

mov ax, [y]
mov bl, 2
div bl
mov [y], al
add ah, 0x30
mov [i], ah
mov eax, 4
mov ebx, 1
mov ecx, i
mov edx, 1
int 0x80

mov ax, [y]
mov bl, 2
div bl
mov [y], al
add ah, 0x30
mov [i], ah
mov eax, 4
mov ebx, 1
mov ecx, i
mov edx, 1
int 0x80

jmp exit

p2:
sub eax, 0x30

exit:
mov eax, 4
mov ebx, 1
mov ecx, 0xA
mov edx, 1
int 0x80

mov eax, 1
mov ebx, 0
int 0x80


