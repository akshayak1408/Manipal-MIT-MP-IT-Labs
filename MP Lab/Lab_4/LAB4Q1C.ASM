DATA SEGMENT
        A DW 00F2H
        B DW 0002H
        C DD 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,A
        MOV BX,B
        IMUL BX

        MOV WORD PTR C,AX
        MOV WORD PTR C+2,DX

        MOV AH,4CH
        INT 21H
CODE ENDS
END START


