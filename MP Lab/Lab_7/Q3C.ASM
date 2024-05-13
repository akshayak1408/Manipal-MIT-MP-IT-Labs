Data Segment
A db 35h,34h,33h,32h,31h,30h,29h,28h,27h,26h
;msg db 'Sorted order is',10,13,'$'
Data ends

Code Segment
Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX
        mov si,0

up1:    mov di,0
        mov cx,9
        sub cx,si
back:   mov bl,a[di]
        cmp bl,a[di+1]
        jbe next
        xchg bl,a[di+1]
        mov a[di],bl
next:   inc di
        cmp di,cx
        jb back
        inc si
        cmp si,9
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
