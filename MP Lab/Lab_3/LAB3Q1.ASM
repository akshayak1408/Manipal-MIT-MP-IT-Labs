DATA SEGMENT
        SUM DW 0
        CARRY DW 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        CLC
        MOV BX,2314H
        ADD BX,0F361H
        MOV SUM,BX
        ADC CARRY,0

        MOV AH,4CH
        INT 21H
CODE ENDS
END START



