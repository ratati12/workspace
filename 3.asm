section .data:
openokey db 'openOK', 0xA
fde db 'filename doesnt exist', 0xA
hello db 'Enter filename:' , 0xA
section .bss
fd resb 4
filename resb 3
buffer resb 1
section .text:
global _start
_start:

;mov eax, 4 ; sys_write
;mov ebx, 1
;mov ecx, hello
;mov edx, 15
;int 0x80

pop ebx
pop ebx
pop ebx
;mov eax, 3 ; sys_read
;mov ebx, 0
;mov ecx, filename
;mov edx, 10
;int 0x80

;mov ebx, filename

mov eax, 5 ; sys_open
mov ecx, 0
mov edx, 0
int 0x80

cmp eax, 0xfffffffe
jnz openok

mov eax, 4 ; sys_write
mov ebx, 1
mov ecx, fde
mov edx, 22
int 0x80

jmp exit

openok:

mov eax, 4 ; sys_write
mov ebx, 1
mov ecx, openokey
mov edx, 7
int 0x80

exit:

mov eax, 1 ; sys_exit
mov ebx, 0
int 0x80
