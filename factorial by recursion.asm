.model large
.stack 100h
.data
string byte 10 dup('$')
.code

fa proc
dec bl

mul bl
cmp bl,1
je l
call fa

l:
ret
fa endp

main proc
mov ax,@data
mov ds,ax

mov ah,1
int 21h

sub al,48
mov bl,al
call fa
mov bx,offset string
add al,48
mov [bx],al
mov dx,offset string
mov ah,9
int 21h


mov ax,4c00h
int 21h
main endp
end main

