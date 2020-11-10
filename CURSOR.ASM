.model small
disp macro msg
        lea dx, msg
        mov ah,09h
        int 21h
endm
.data
row db 02 dup(0)
col db 02 dup(0)
msg1 db 0dh,0ah,"Enter X-coordinate: $"
msg2 db 0dh,0ah,"Enter Y-coordinate: $"

.code
mov ax,@data
mov ds,ax
disp msg1
mov si, offset row
call read
disp msg2
mov si, offset col
call read
mov si, offset row
mov ah,[si]
inc si
mov al,[si]
sub ax,3030h
aad
mov dh,al  ;row
mov si,offset col
mov ah,[si]
inc si
mov al,[si]
sub ax,3030h
aad
mov dl,al

mov ah,00
mov al,03h
int 10h
mov ah,02h
int 10h
jmp final

read proc near
        mov cx,02h
   back: mov ah,01h
   int 21h
   mov [si],al
   inc si
   dec cx
   jnz back
ret
read endp

final: mov ah,01h
int 21h
mov ah,4ch
int 21h
end

