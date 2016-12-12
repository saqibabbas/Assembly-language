.model small
.386
.stack 100h
print Macro num
	local l1,l2
	push ax
	push bx
	push cx
	Push dx

	mov cx,0
	mov bx,10
	mov ax,num
L1:
	mov dx,0
	div bx
	push dx
	inc cx
	cmp ax,0
	jg L1
	
	mov ah,2
L2:
	pop dx
	add dx,48
	int 21h
	Loop L2

	pop dx
	pop cx
	pop bx
	pop ax
endm
.data
v1 byte 15
v2 byte 3
.code
start proc
mov ax,@data
mov ds,ax
movzx dx,v2
l1:
mov ax,dx
mov bl,v1
div bl
cmp ah,0
jz l2
inc dx
jmp l1
l2:
mov ax,dx
mov bl,v2
div bl
inc dx
cmp ah,0
jz l3
jnz l1
l3:
dec dx
print dx

mov ah,4ch
int 21h
start endp
end start
