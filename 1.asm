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
;yxvz
mov eax, 0
mov eax, [y]
cmp eax, 0x46
jg p1
mov eax, 4
mov ebx, 1
mov ecx, y
mov edx, 1
int 0x80

p1:
mov eax, [x]
cmp eax, 0x46
jg p2
mov eax, 4
mov ebx, 1
mov ecx, x
mov edx, 1
int 0x80

p2:
mov eax, [v]
cmp eax, 0x46
jg p3
mov eax, 4
mov ebx, 1
mov ecx, v
mov edx, 1
int 0x80

p3:
mov eax, [z]
cmp eax, 0x46
jg p4
mov eax, 4
mov ebx, 1
mov ecx, z
mov edx, 1
int 0x80

p4:
mov eax, 4
mov ebx, 1
mov ecx, ln
mov edx, 1
int 0x80

mov eax, 1
mov ebx, 0
int 0x80


