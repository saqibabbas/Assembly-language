.model small
.386
.stack 100h

print macro num
local L1,L2
push ax
push bx
push cx
push dx

mov ax,num
mov bx,10
mov cx,0

L1:
	mov dx,0
	div bx
	push dx
	inc cx
	cmp ax,0
	jg L1

L2:
	pop dx
	add dx,48
	mov ah,2
	int 21h
	loop L2

pop dx
pop cx
pop bx
pop ax
endm

.data
v1 byte 30 
v2 byte 10
.code
start proc
mov ax,@data
mov ds,ax
movzx dx,v1
mov cl,v2
l1:
mov ax,dx
mov bl,cl
div bl
cmp ah,0
jz l2
dec cl
jmp l1
l2:
movzx ax,v2
mov bl,cl
div bl
dec cl
cmp ah,0
jz l3
jnz l1
l3:
inc cl
movzx dx,cl
print dx

mov ah,4ch
int 21h
start endp
end start
