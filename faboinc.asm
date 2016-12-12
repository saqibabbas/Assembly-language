.model large
.stack 100h
.data
string db 10 dup('  $')
first db 1
second db 2
.code

main proc
mov ax,@data
mov ds,ax

mov ah,1
int 21h
mov ah,0
sub al,48
mov cl,al
mov ch,0

mov bx,offset string
mov al,first
add al,48
mov dl,second
add dl,48
mov [bx],al
inc bx
mov [bx],dl
inc bx
l:
mov al,first
mov dl,second
add al,dl
add al,48
mov [bx],al
inc bx
sub al,48
mov first,dl
mov second,al
loop l



mov dx,offset string
mov ah,9
int 21h


mov ax,4c00h
int 21h
main endp
end main

