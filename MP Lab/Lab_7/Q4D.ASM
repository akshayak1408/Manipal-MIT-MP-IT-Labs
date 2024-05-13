Data Segment
A dw 1235h,1234h,1233h,1232h,0ff31h,0ff30h,1229h,0ff28h,1227h,1226h
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
        add di,02
        mov cx,20
back:   mov bx,a[di]
        cmp bx,a[bp]
        jge next
        mov bp,di
next:   inc di
        inc di
        cmp di,cx
        jb back
        mov ax,a[bp]
        xchg ax,a[si]
        mov a[bp],ax
        inc si
        inc si
        cmp si,17
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
