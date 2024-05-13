DATA SEGMENT
        ARR DB 1H,2H,3H,4H,5H,6H,7H,8H,9H,10H
        ELE DB 5H
        MSG DB "ELEMENT FOUND!$"
        MSG2 DB "ELEMENT NOT FOUND!$"
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV SI,0
        MOV CX,10
        MOV AL,ELE
BACK:
        CMP AL,ARR[SI]
        JZ EXIT
        INC SI
        LOOP BACK

        LEA DX,MSG2
        JMP NEXT
EXIT:
        LEA DX,MSG
NEXT:
        MOV AH,09
        INT 21H

        MOV AH,4CH
        INT 21H

CODE ENDS
END START
