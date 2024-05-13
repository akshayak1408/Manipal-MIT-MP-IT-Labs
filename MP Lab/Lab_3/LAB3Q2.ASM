DATA SEGMENT
        A DB 96H
        B DB 22H
        SUM DB 0
        CARRY DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AL,A
        CLC
        ADD AL,B
        DAA
        MOV SUM,AL
        ADC CARRY,0

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
