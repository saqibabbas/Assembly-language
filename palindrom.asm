.model small
 .stack 100h 
.data
 string1 db 10 dup('$')
 string2 db 10 dup('$')
result1 db 'not  palindrom $'
result2 db ' palindrom $'
counter db ?
.code

main proc
mov ax,@data
 mov ds,ax 
mov bx,offset string1 
mov cx,0 
l:
mov ah,01 
int 21h
 cmp al,0dh 
je net
mov [bx],al 
mov ah,0
mov dx,ax
push dx 
inc cx 
inc bx 
jmp l

net:
mov bx,offset string2
mov counter,cl
jmp next

next:
pop dx 
mov [bx],dx
inc bx 
loop next
mov cl,counter
mov si,offset string1
mov di,offset string2
o:
mov al,[si]
mov bl,[di]
cmp al,bl

jne saqib
inc si
inc di
loop o
mov dx,offset result2
mov ah,09 
int 21h
jmp abbas

saqib:
mov dx,offset result1
mov ah,09 
int 21h
jmp abbas

abbas:
mov ax,4c00h
int 21h 
main endp 
end main