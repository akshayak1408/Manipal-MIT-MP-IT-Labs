DATA SEGMENT
        A DW 0D2A4H
        B DW 1321H
        DIFF DW 0
        BORR DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,A
        MOV BX,B
        SUB AX,BX
        MOV DIFF,AX
        SBB BORR,0

        MOV AH,4CH
        INT 21H
CODE ENDS
END START

       
