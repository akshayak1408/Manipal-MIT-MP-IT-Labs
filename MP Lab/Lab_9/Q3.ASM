Data Segment
        main db 10 dup('$')
        len1 db ?
        subSTR db 5 dup('$')
        len2 db ?
        exists db 10,'Substring exists$'
        nExists db 10,'Substring does not Exist $'
Data ends

Code Segment
        Assume CS:Code,DS:Data
Start:
        MOV AX,Data
        MOV DS,AX
        MOV ES,AX

        lea di,main
  	call read
	mov len1,cl

        MOV DL,10
        MOV AH,02H
        INT 21H
       
        lea di,subSTR
        call read
	mov len2,cl

        MOV CH,0
        MOV BL,LEN1
        MOV BH,0
       ; MOV DL,LEN1
        ;CALL PRINT
        ;MOV DL,LEN2
        ;CALL PRINT
	cld

        lea si,main
up3:    lea di,subSTR
        CMP SI,BX
        JZ NSIMILAR
	mov al,[si]
	cmp al,[di]
	jnz next
        mov cL,LEN2
        MOV CH,0
	repe cmpsb
	jz similar
	jmp next2
next:   inc si
next2:	jmp up3
nsimilar:lea dx,nExists
        JMP HAHA
similar:lea dx,exists
HAHA:    mov ah,09h
	int 21h	

         mov ah,4ch
         int 21h

read proc
	mov cl,0
up:     mov ah,01h
        int 21h
        cmp al,'$'
        jz down
        stosb
        inc cl
        jmp up
down:  
	ret
        READ endp

PRINT PROC
        ADD DL,30H
        MOV AH,02H
        INT 21H
        MOV DL,10
        MOV AH,02H
        INT 21H
        RET
        PRINT ENDP

Code ends
end Start

        
