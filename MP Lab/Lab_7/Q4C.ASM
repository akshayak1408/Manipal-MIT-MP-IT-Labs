Data Segment
A db 35h,34h,33h,32h,31h,0f3h,0f9h,28h,27h,26h
;msg db 'Sorted order is',10,13,'$'
Data ends

Code Segment
Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX
        mov si,0

up1:    mov bp,si
        mov di,si
        add di,01
        mov cx,10
back:   mov bl,a[di]
        cmp bl,a[bp]
        jge next
        mov bp,di
next:   inc di
        cmp di,cx
        jb back
        mov al,a[bp]
        xchg al,a[si]
        mov a[bp],al
        inc si
        cmp si,09
        jb up1

exit:   mov ah,4ch
        int 21h

disp proc
        mov dl,bl
	mov cl,04
        shr dl,cl
        call disphex
        mov dl,bl
        and dl,0fh
        call disphex
	ret
	disp endp

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
