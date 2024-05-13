DATA SEGMENT
        A DD 12345678H
        B DW 2436H
        RESULT DW ?
        REMAINDER DW ?
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,WORD PTR A
        MOV DX,WORD PTR A+2
        MOV BX,B

        DIV BX
        MOV RESULT,AX
        MOV REMAINDER,DX

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
