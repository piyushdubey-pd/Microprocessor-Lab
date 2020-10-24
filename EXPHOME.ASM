.model small
.data
a dw 245
b dw 25
c dw 34
d dw 50
r1 dw ?
r2 dw ?
r3 dw ?
quo db ?
rem db ?

.code
mov ax,@data
mov ds,ax
mov ax,a
mov bx,b
add ax,bx
mov r1,ax

mov ax,c
mov bx,d
add ax,bx
mov r2,ax

mov ax,b
mov bx,d
add ax,bx
mov r3,ax

mov ax,r1

mul r2

div r3

mov rem,ah
mov quo,al

mov ah,4ch
int 21h
end


