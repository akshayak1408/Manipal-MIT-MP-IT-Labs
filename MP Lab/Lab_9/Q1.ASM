Data Segment
        actual_psd db 'Fcomp$'
        length db $-actual_psd-1
        kb_psd db 10 dup('$')
        valid db 10,'Password is valid$'
        nvalid db 10,'Password is Invalid$'
Data ends

Code Segment
        Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX
        MOV ES,AX

        lea di,kb_psd
        mov cx,0

back:   mov ah,08h
        int 21h
        cmp al,'$'
        jz exit
        stosb
        inc cl
        mov dl,'*'
        mov ah,02h
        int 21h
        jmp back

exit:   cmp cl,length
        jnz notValid
        lea si,actual_psd
        lea di,kb_psd
        repe cmpsb
        jz sim

notValid: lea dx,nvalid
          jmp next

sim:    lea dx,valid
next:   mov ah,09h
        int 21h

        mov ah,4ch
        int 21h

Code ends
end Start
