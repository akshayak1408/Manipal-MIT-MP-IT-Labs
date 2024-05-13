Data Segment
A db ?
B db ?
breakline db 10,13,'$'
sum db ?
Data ends

input macro n1
	mov ah,01
        int 21h
        call ascii2hex
        mov bl,al
        mov ah,01h
        int 21h
        call ascii2hex
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
	mov dl,a
	add dl,b
	mov sum,dl

	lea dx,breakline
	mov ah,09
	int 21h

        mov dx,0
	mov dl,sum
	mov cl,04
	shr dl,cl
	call disphex
	mov dl,sum
	and dl,0fh
	call disphex	

        mov ah,4ch
        int 21h

ascii2hex proc
        sub al,30h
        cmp al,09
        jbe next
        sub al,07
next:   ret
        ascii2hex endp

disphex proc
	cmp dl,09
        jc next2
	add dl,07
next2:  add dl,30h
	mov ah,02h
	int 21h
	ret 
        disphex endp

code ends 
end start
	
