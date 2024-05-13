Data segment
bcd dw 1234H
hex dw ?
data ends

code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax

mov ax,0h
mov bx,00001H
call bcd2hex
mov bx,000AH
call bcd2hex
mov bx,0064H
call bcd2hex
mov bx,03e8H
call bcd2hex
mov ah,4ch
int 21h
bcd2hex:
mov ax,bcd
and ax,000fh
mul bx
add hex,ax
mov cl,04
ror bcd,cl
ret
code ends
end start
