.model small
display macro msg
  lea dx, msg
  mov ah, 09h
  int 21h
endm
.data
  n db 5
  a db 05, 07, 04, 03, 06
  msg1 db 0dh, 0ah, "1>> SORT IN ASCENDING ORDER$"
  msg2 db 0dh, 0ah, "2>> SORT IN DESCENDING ORDER$"
  msg3 db 0dh, 0ah, "3>> EXIT$"
  msg4 db 0dh, 0ah, "ENTER YOUR CHOICE $"
  msg5 db 0dh, 0ah, "INVALID CHOICE$"
.code
  mov ax, @data
  mov ds, ax
  display msg1
  display msg2
  display msg3
  display msg4
  mov ah, 01h
  int 21h
  sub al, 30h
  cmp al, 01h
  je ascsort
  cmp al, 02h
  je dessor
  cmp al, 03h
  je final
  display msg5
  jmp final
ascsort:
  mov cl, n
  dec cl

outloop: mov ch, cl
mov si, 00h

inloop: mov al, a[si]
inc si
cmp al, a[si]
jc noexch
xchg al, a[si]
mov a[si-1], al

noexch: dec ch
jnz inloop
dec cl
jnz outloop
jmp final

dessor:
  mov cl, n
  dec cl

outloop1: mov ch, cl
mov si, 00h

inloop1: mov al, a[si]
inc si
cmp al, a[si]
jnc noexch1
xchg al, a[si]
mov a[si-1], al

noexch1: dec ch
jnz inloop1
dec cl
jnz outloop1
jmp final

final: mov ah, 4ch
int 21h

end
