.model small
.data
a dw 1234h
b db 20h
c dw ?

.code
mov ax, @data
mov ds,ax
mov ax,a
mov bl,b
add ax,bx
mov c,ax
mov ah,4ch
int 21h
end

