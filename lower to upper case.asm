.model small
 .stack 100h 
.data
 string db 10 dup('$')
 
.code

main proc
mov ax,@data
 mov ds,ax 
mov bx,offset string
mov cx,0
l:
mov ah,01 
int 21h
 cmp al,0dh 
je saqib
inc cx
sub al,32
mov [bx],al 
inc bx 
jmp l




saqib:
mov dx,offset string
mov ah,09 
int 21h
jmp abbas

abbas:
mov ax,4c00h
int 21h 
main endp 
end main