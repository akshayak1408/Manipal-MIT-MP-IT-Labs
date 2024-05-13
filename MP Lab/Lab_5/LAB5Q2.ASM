DATA SEGMENT
HEX DW 34H
BCD DD ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV BX,0AH
        MOV CL,0
        MOV SI,0
        MOV AX,HEX
BACK:
        MOV DX,0
	DIV BX
        SHL DX,CL
        ADD SI,DX
        ADD CL,04
        CMP AX,0
	JZ EXIT
        CMP CL,BH
	JNZ BACK
EXIT:
        MOV WORD PTR BCD,SI
        MOV WORD PTR BCD+2,AX
        MOV AH,4CH
	INT 21H
CODE ENDS
END START
