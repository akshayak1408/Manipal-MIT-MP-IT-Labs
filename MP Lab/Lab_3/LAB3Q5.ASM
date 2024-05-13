DATA SEGMENT
        A DD 99999999H
        B DD 11111111H
        DIFF DD 0
        BORR DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV CX,02
        MOV SI,0
BACK:
        MOV AX,WORD PTR A[SI]
        SBB AX,WORD PTR B[SI]
        MOV WORD PTR DIFF[SI],AX
        INC SI
        INC SI
        LOOP BACK

        SBB BORR,0

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
