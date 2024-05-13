Data Segment
        main db 10 dup('$')
        len1 db ?
        A db 10,13,"$"
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
        dec cl

        lea si,main
back:   mov al,main[si]
        cmp al,50h
        jb exit
        cmp al,56h
        jb next
        sub al,20h
        mov main[si],al
        jmp next
exit:   add al,20h
        mov main[si],al
next:   inc si
        cmp si,cl
        ja deetee
        jmp back


deetee: lea dx,A
        mov ah,09h
        int 21h
        lea dx,main
        mov ah,09h
        int 21h

        mov ah,4ch
        int 21h
Code ends
end Start

        
