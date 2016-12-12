.model large
.stack 200h
.data
;output byte 10 dup('$')
input byte 10 dup('$')
result db ?
binary db 20 dup('$')
 .code

string_integer proc

numbers:
mov ah,1
int 21h
inc cx
mov [bx],al
inc bx
cmp al,0dh
je station
jmp numbers
station:
mov bx,offset input
mov al,0
mov dl,0
dec cx
cmp cx,2
jge multiple_character
jmp single_character
single_character:
mov dl,[bx]
sub dl,48
mov result,dl
mov al,result
cmp cx,1
je i
multiple_character:
mov dl,[bx]
sub dl,48
mov al,10
mul dl
mov result,al
inc bx
dec cx
jmp addition
addition:
mov dl,[bx]
sub dl,48
add dl,result
mov result,dl
mov al,result
dec cx
cmp cx,0
je i
jmp multiplication
multiplication:
mov al,10
mul result
mov result,al
inc bx
jmp addition
i:
ret
string_integer endp

main proc
mov ax,@data
mov ds,ax
mov bx,offset input
mov cx,0

call string_integer
mov bx,offset binary
;here data is in integer form in 'ax'
mov cx,1
bin:
mov ah,0
mov bx,2
mov bh,0
mov dx,0
div bx
mov bx,dx
add bx,48
push bx
inc cx
cmp ax,1
jbe de
jmp bin
de:
add ax,48
push ax
mov bx,offset binary
saqib:
pop dx
mov [bx],dx
inc bx
loop saqib
mov ah,09
mov dx,offset binary
int 21h
mov ax,4c00h
int 21h
main endp
end main

