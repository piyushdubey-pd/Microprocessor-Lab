.model small
.code
mov ah,2ch
int 21h
 ;reads time from system as
 ;hrs=ch mins=cl sec=dh

mov al,ch
call show
mov al,cl
call show
mov al,dh
aam
mov bx,ax
call disp

mov ah,4ch
int 21h

show proc near
aam
mov bx,ax
call disp
mov dl,':'
mov ah,02h
int 21h
ret
show endp

disp proc near
mov dl,bh
add dl,30h
mov ah,02h
int 21h
mov dl,bl
add dl,30h
mov ah,02h
int 21h
ret
disp endp

end
