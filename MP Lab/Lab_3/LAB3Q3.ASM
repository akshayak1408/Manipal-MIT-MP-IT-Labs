DATA SEGMENT
        A DD 0A6781D32H
        B DD 1637A927H
        SUM DD 0
        CARRY DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV SI,0
        CLC
        MOV CX,02
BACK:
        MOV AX, word ptr A[SI]
        ADC AX,word ptr B[SI]
        MOV word ptr SUM[SI],AX
        INC SI
        INC SI
        LOOP BACK

        ADC CARRY,0

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
                                
