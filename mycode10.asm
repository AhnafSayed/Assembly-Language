.MODEL
.STACK 100H
.DATA
.CODE
    MAIN PROC
        
        MOV CX, 9
        MOV AL, 100
        
        REVERSE:
           SHL AL, 1
           RCR BL, 1
           LOOP REVERSE
           MOV BL, AL
           
        EXITTIDOS:
           MOV AX 4CH
           INT 21H
    MAIN ENDP
    END MAIN
           