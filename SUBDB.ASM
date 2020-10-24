.model small
.data
a db 30h
b db 25h
c db ?

.code
mov ax, @data
mov ds, ax
mov al,a
sub al,b
mov c, al
mov ah, 4ch
int 21h
end

