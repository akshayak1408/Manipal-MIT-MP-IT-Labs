DATA SEGMENT
        A DW 6534H
        B DW 4532H
        C DD ?
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV DX,0
        MOV CX,B
        MOV AX,0
        MOV BX,A
BACK:
        ADD AX,BX
        ADC DX,0
        LOOP BACK

        MOV WORD PTR C,AX
        MOV WORD PTR C+2,DX

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
