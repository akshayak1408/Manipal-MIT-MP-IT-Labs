Data Segment
A db ?
B db ?
breakline db 10,13,'$'
sum db ?
Data ends

input macro n1
	mov ah,01
        int 21h
        call ascii2dec
        mov bl,al
        mov ah,01h
        int 21h
        call ascii2dec
        mov cl,04
        shl bl,cl
        add bl,al
        mov n1,bl
endm

Code Segment
Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX
	mov bl,0
        input a
        lea dx,breakline
	mov ah,09
	int 21h
	input b
	clc
        mov al,a
        add al,b
        daa
	mov sum,al

	lea dx,breakline
	mov ah,09
	int 21h

        mov dx,0
	mov dl,sum
	mov cl,04
	shr dl,cl
        call dispdec
	mov dl,sum
	and dl,0fh
        call dispdec 

        mov ah,4ch
        int 21h

ascii2dec proc
        sub al,30h
next:   ret
        ascii2dec endp

dispdec proc
next2:  add dl,30h
	mov ah,02h
	int 21h
	ret 
        dispdec endp

code ends 
end start
	
