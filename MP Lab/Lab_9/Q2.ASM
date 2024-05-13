Data Segment
        main db 10 dup('$')
        len1 db ?
        exists db 10,'It is a Palindrome$'
        nExists db 10,'Not a Palindrome$'
Data ends

Code Segment
        Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX
        MOV ES,AX

        lea di,main
        mov cl,0
up:     mov ah,01h
        int 21h
        cmp al,'$'
        jz down
        stosb
        inc cl
        jmp up
down:   mov len1,cl

        lea si,main
        mov di,cl
        dec di
back:   mov al,main[si]
        cmp al,main[di]
        jne exit
        inc si
        dec di
        cmp si,di
        ja pal
        jmp back
exit:   lea dx,nExists
        jmp next
pal:    lea dx,exists
next:   mov ah,09h
        int 21h

        mov ah,4ch
        int 21h
Code ends
end Start

        
