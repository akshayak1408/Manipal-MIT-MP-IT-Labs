Data Segment
A db 14h,12h,13h,15h,17h,20h,23h,0ah,33h,35h
smallest db ?
msg db 'Smallest number is $'
Data ends

Code Segment
Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX

        mov si,0
        mov bl,a[si]
        inc si
        mov cx,09
back:   cmp bl,a[si]
        jbe next
        mov bl,a[si]
next:   inc si
        loop back

        mov smallest,bl
        lea dx,msg
        mov ah,09
        int 21h

        mov dl,smallest
        mov cl,04
        shr dl,cl
        call disphex
        mov dl,smallest
        and dl,0fh
        call disphex

        mov ah,4ch
        int 21h

disphex proc
        cmp dl,09
        jc next2
        add dl,07
next2:  add dl,30h
        mov ah,02
        int 21h
        ret
        disphex endp

code ends
end start
