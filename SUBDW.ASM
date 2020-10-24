.model small
.data
a dw 2345h
b dw 4521h
c dw ?
d dw ?

.code
mov ax,@data
mov ds, ax
mov ax,a
mov bx,b
add ax,bx
mov d, ax
sub bx, ax
mov c,bx
mov ah,4ch
int 21h
end

