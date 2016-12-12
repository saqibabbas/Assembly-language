.MODEL large
.STACK 200H
.DATA
filedata db 50 dup(?)
filename db 13 dup(?)
titl db 0ah, "Enter File Name (abc.txt): $"
text db 0ah,"Enter text : $"
choice db "Do you want to make new file ??(y/n) $ "
choice1 db 0ah,"press r to read existing file $"
choice2 db 0ah,"press w to write existing file : $"
space db 0ah,"$"
.CODE

read proc
mov dx,offset titl
mov ah,9
int 21h
mov bx, offset filename
saqib1: 
mov ah, 01h
int 21h
cmp al, 0Dh
je abbas1
mov [bx], al
inc bx
jmp saqib1
abbas1:
mov dx, offset filename
mov al, 0
mov ah, 3Dh
int 21h
mov bx, ax
mov cx,50
mov dx,offset filedata
mov ah, 3fh
int 21h
mov ah, 3Eh
int 21h

mov dx,offset filedata
mov ah,9
int 21h
ret
read endp

write proc
mov dx, offset text
mov ah, 09h
int 21h
mov bx, offset filedata
saq: 
mov ah, 01h
int 21h
cmp al, 0Dh
je abb
mov [bx], al
inc bx
jmp saq
abb: 
mov dx, offset filename
mov al, 1
mov ah, 3Dh
int 21h
mov bx, ax
mov cx,50
mov dx,offset filedata
mov ah, 40h
int 21h
mov ah, 3Eh
int 21h
ret
write endp

createfile proc
mov dx, offset titl
mov ah, 09h
int 21h
mov bx, offset filename
saqib: 
mov ah, 01h
int 21h
cmp al, 0Dh
je abbas
mov [bx], al
inc bx
jmp saqib
abbas:
mov dx, offset filename
mov cx,0
mov ah, 3Ch
int 21h
ret
createfile endp



main PROC
mov ax,@data
mov ds,ax
mov dx,offset choice
mov ah,9
int 21h

mov ah,1
int 21h
cmp al,"n"
je station
call createfile
station:
mov dx,offset choice1
mov ah,9
int 21h
mov dx,offset choice2
mov ah,9
int 21h
mov ah,1
int 21h
mov dx,offset space
mov ah,9
int 21h
cmp al,"r"
je station2
call write
jmp l
station2:
call read
l:
mov ax,4c00h
int 21h
main endp
end main



