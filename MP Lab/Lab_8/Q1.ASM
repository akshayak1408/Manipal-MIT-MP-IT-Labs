Data Segment
A db 10,13,'$'
Data ends

Code Segment
Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX

        mov ah,01h
        int 21h

        mov al,0

        mov ah,08h
        int 21h

	lea dx,a
        mov ah,09
        int 21h

        mov dh,0
        mov dl,al
        mov ah,02h
        int 21h

        mov ah,4ch
        int 21h

code ends
end start
