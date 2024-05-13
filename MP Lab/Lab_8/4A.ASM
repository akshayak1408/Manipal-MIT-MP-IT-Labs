Data Segment
bline db 10,13,'$'
hexa db ?
deci db ?
data ends

input macro n1
        mov ah,01
        int 21h
        call ascii2hex
        mov bl,al
        mov cl,04
        shl bl,cl
        mov ah,01h
        int 21h
        call ascii2hex
        add bl,al
        mov n1,bl
endm

Code Segment
Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX

        mov bl,0
        input hexa

        mov al,hexa
        mov cl,04
        MOV AH,0
        mov bl,0ah
        DIV bl
        SHL AL,CL
        add aH,AL
        mov deci,aH

        lea dx,bline
        mov ah,09h
        int 21h
        mov dx,0
        mov dl,deci
        mov cl,04
        shr dl,cl
        call disphex
        mov dl,deci
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
        cmp dl,0ah
        jc next2
        add dl,07h
next2:  add dl,30h
        mov ah,02h
        int 21h
        ret
        disphex endp

code ends
end Start

