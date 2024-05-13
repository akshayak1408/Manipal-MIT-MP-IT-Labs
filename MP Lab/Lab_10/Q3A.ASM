DATA SEGMENT
N1 DB 11H
N2 DB 46H
DATA ENDS


CODE SEGMENT
ASSUME CS:CODE
START:
 MOV AX,DATA
 MOV DS,AX

 MOV BH,N1
BACK:
CMP BH,N2
JA LAST
; Extract MS digit of count
 MOV BL,BH
 AND BL,0F0H
; Convert to HEXAdecimal value
 MOV CL,4
 ROR BL,CL
 CMP BL,09
 JBE HII
 ADD BL,07
HII: ADD BL,30H
 MOV DL,BL
 CALL DISP

; Extract the LS digit and convert to decimal value
 MOV BL,BH
 AND BL,0FH
 CMP BL,09
 JBE HII2
 ADD BL,07
HII2: ADD BL,30H
 MOV DL,BL
 CALL DISP
 MOV AL,BH
 ADD AL,01H
 MOV BH,AL
; Provide delay to display the next count value
 CALL DELAY
; Set the cursor to starting location of the same line
 MOV DL,13
 CALL DISP
 MOV DL,0FFH
 MOV AH,06
 INT 21H
 JNZ DOWN
UPP: JMP BACK
DOWN: CMP AL,13
 JNZ BACK

LAST: MOV AH,4CH
 INT 21H
; Procedure to display the value
DISP PROC
 MOV AH,02
 INT 21H
 RET
DISP ENDP
; Delay function
DELAY PROC
MOV SI,03333H
 UP1: MOV DI,033H
 UP: DEC DI
 JNZ UP
 DEC SI
 JNZ UP1
 RET
DELAY ENDP
 CODE ENDS
 END START
