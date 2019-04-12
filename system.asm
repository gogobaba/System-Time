;================================================
;   ***8086 PROGRAM TO DISPLAY SYSTEM TIME***   =
;MOV AH,2CH interupt for getting system time    =
;hours will be in CH                            =
;min in CL                                      =
;seconds in DH                                  =
;================================================

DATA SEGMENT 
msg DB 13,10 ,'TIME IS  $'
DATA ENDS
CODE SEGMENT 
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
       MOV DS,AX
       
       LEA DX,msg  ; 
       MOV AH,09H  ;Interrupt for
       INT 21H     ;string output
       
       ;hours
       MOV AH,2CH
       INT 21H
       MOV AL,CH
       AAM
       MOV BX,AX
       CALL DISP
       
       MOV DL,':'
       MOV AH,02H    ;Interrupt for
       INT 21H       ;character output
       
       ;minutes
       MOV AH,2CH
       INT 21H
       MOV AL,CL
       AAM
       MOV BX,AX
       CALL DISP
       
       MOV DL,':'
       MOV AH,02H    ;Interrupt for
       INT 21H       ;character output
       
       ;seconds
       MOV AH,2CH
       INT 21H
       MOV AL,DH
       AAM
       MOV BX,AX
       CALL DISP
       
       ;to terminate the program
       MOV AH,4CH
       INT 21H
       
       ;display subroutine
       DISP PROC
       MOV DL,BH
       ADD DL,30H
       MOV AH,02H
       INT 21H
       MOV DL,BL
       ADD DL,30H
       MOV AH,02H
       INT 21H
       RET
       DISP ENDP

CODE ENDS
END START
       
