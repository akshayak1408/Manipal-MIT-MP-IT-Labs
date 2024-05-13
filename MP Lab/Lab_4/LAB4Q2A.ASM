DATA SEGMENT
        A DW 1458H
        B DB 76H
        RESULT DW ?
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,A
        MOV BL,B
        DIV BL
        MOV RESULT,AX

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
