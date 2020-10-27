.model small
display macro msg
        lea dx,msg
        mov ah,09h
        int 21h

endm

.data
msg1  db 0dh,0ah,"Enter string: $"
msg2 db 0dh,0ah,"Reverse string: $"
msg3 db 0dh,0ah,"Input String is Palindrome. $"
msg4 db 0dh,0ah,"Input String is not Palindrome. $"

string db 80h dup(?)
rstring db 80h dup(?)

.code
start: mov ax,@data
       mov ds, ax
       display msg1

       mov si,offset string
       xor cl,cl
again: mov ah,01h
       int 21h
       cmp al,0dh
       je next
       mov [si],al
       inc si
       inc cl
       jmp again

next: mov [si], byte ptr '$'
dec si
mov ch,cl
mov di, offset rstring

back: mov al,[si]
mov [di] , al
dec si
inc di
dec ch
jnz back
mov [di], byte ptr '$'
display msg2
display rstring
mov si, offset string
mov di, offset rstring

ag:
mov al,[si]
cmp al,[di]
jne fail
inc si
inc di
dec cx
jz success
jmp ag

fail: display msg4
jmp final

success: display msg3
final: mov ah,4ch
int 21h
end
