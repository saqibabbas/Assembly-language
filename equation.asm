.model large
.stack 300h
.data
output byte 10 dup('$')        ;y=a^2+b^2-2ab
input byte 10 dup('$')
result db ?
a_value db ?
b_value db ?
sq_a_value db ?                        
sq_b_value db ?
add_value db ?
mab_value db ?
show_a db 'enter a $'
show_b db 'enter b $'
.code
integer_string proc
mov ah,0
mov bx,10
mov cx,0
mov dx,0
saqib:
div bx
add dx,48
push dx
mov dx,0
inc cx
cmp ax,0
jne saqib

mov bx,offset output
p:
pop dx
mov [bx],dl
inc bx
loop p

mov ah,09
mov dx,offset output
int 21h

integer_string endp


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

mov dx,offset show_a
mov ah,9
int 21h
call string_integer

mov ah,0
mov a_value,al
mul a_value
mov sq_a_value,al

mov dx,offset show_b
mov ah,9
int 21h
mov cx,0
call string_integer
mov b_value,al
mul b_value
mov sq_b_value,al


mov al,sq_a_value
mov bl,sq_b_value
add al,bl
mov add_value,al
mov al,a_value
mov bl,b_value
mul bl
mov bl,2
mul bl
mov mab_value,al
mov bl,mab_value
mov al,add_value
sub al,bl
mov ah,0
call integer_string
mov ax,4c00h
int 21h
main endp
end main

