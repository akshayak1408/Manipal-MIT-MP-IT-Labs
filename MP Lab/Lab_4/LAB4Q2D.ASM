DATA SEGMENT
        A DD 00063124H
        B DW 0FEA2H
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

        IDIV BX
        MOV RESULT,AX
        MOV REMAINDER,DX

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
