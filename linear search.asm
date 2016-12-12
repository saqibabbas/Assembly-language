.model small
.386
.stack 100h
.data
string byte "mehakraza"
str2 byte "Found at $"
str3 byte "Not found$"


.code
start proc
mov ax,@data
mov ds,ax
mov ah,1
int 21h
mov bx,offset string
mov cx,lengthof string
l1:cmp al,byte ptr[bx]
jz l2
inc bx
loop l1
jmp l3

l2:
mov dl,10
mov ah,2
int 21h
mov dx,offset str2
mov ah,9
int 21h
mov bx,lengthof string

sub bx,cx
mov dx,bx
add dx,48
mov ah,2
int 21h
jmp l4

l3:
mov dl,10
mov ah,2
int 21h
mov dx,offset str3
mov ah,9
int 21h

l4:mov ah,4ch
int 21h
start endp
end start
