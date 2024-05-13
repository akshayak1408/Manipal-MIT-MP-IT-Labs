DATA SEGMENT
        A DB 0F2H
        B DB 02H
        C DW ?
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AL,A
        MOV BL,B
        IMUL BL
        MOV C,AX

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
