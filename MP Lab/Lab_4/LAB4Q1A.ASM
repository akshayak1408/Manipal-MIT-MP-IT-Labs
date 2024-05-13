DATA SEGMENT
        A DW 0F458H
        B DW 541AH
        C DD ?
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,A
        MOV BX,B
        MUL BX
        MOV WORD PTR C,AX
        MOV WORD PTR C+2,DX

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
