.model large
.stack 200h
.data
o byte 10 dup('$')
input byte 10 dup('$')
result db ?
var dw ?
num dw 1
.code

integer_string proc
mov ah,0
mov bx,10
mov cx,0
mov dx,0
saq:
div bx
add dx,48
push dx
mov dx,0
inc cx
cmp ax,0
jne saq
mov bx,offset o
p:
pop dx
mov [bx],dl
inc bx
loop p
mov ah,09
mov dx,offset o
int 21h
ret
integer_string endp

main proc
mov ax,@data
mov ds,ax
mov bx,offset input
mov cx,0

numbers:
mov ah,1
int 21h
mov ah,0
cmp al,0dh
je sta
push ax
inc cx
jmp numbers
sta:
mov ax,1 
mov bx,1
mov var,0
g:
pop dx
sub dx,48
mul dx
mov dx,ax
mov ax,num
add dx,var
mov var,dx
mov bx,2
mul bx    
mov num,ax
loop g
mov ax,var
call integer_string



mov ax,4c00h
int 21h
main endp
end main

