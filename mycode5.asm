.MODEL SMALL
.STACK 100H
.DATA   ; IF YOU HAVE VARIABLES
    INPUTMSG DB 'Enter a hex digit: $'
    OUTPUTMSG DB 'In decimal it is: $'
.CODE 
    MAIN PROC  
        ;LOAD DATA SEGMENT INTO DS REGISTER IF YOU HAVE VARIABLES
        MOV AX, @DATA
        MOV DS, AX
        ;NOW SHOW INPUT MSG
        MOV AH, 9
        LEA DX, INPUTMSG
        INT 21H 
        
        ;WAIT FOR SINGLE CHARACTER INPUT
        MOV AH, 1
        INT 21H
        ;NOW YOU HAVE THE SINGLE CHARACTER IN AL
        ;MOV INPUT INTO ANOTHER REGISTER TO KEEP IT SAFE
        MOV BL, AL 
        
        CMP BL, 'A'
        JL INVALIDINPUT
        
        MOV AH, 2
        MOV DL, 0AH
        INT 21H 
        
        MOV DL, 0DH
        INT 21H
        
        LEA DX, OUTPUTMSG
        MOV AH, 9
        INT 21H 
        ;NOW WHAT SHOULD YOU DO TO SHOW THE DECIMAL OF IT
        ;FIRST SHOW THE FIRST DIGIT IN DECIMAL WHICH IS 1 FROM ALL THE
        MOV AH, 2
        MOV DL, '1'
        INT 21H
        ;NOW TO SHOW THE SECOND DIGIT 
        
        SUB BL, 11H
        MOV DL, BL
        INT 21H   
        ;NOW JUMP TO EXITTODOS - UNCONDITIONAL JMP
        JMP EXITTODOS
        
        INVALIDINPUT:
        ;SHOW ERROR MASSAGE
        MOV AH, 9
        LEA DX, ERRORMSG
        INT 21H
        
        
        ;EXIT TO DOS
        EXITTODOS:
        MOV AX, 4CH
        INT 21H
    MAIN ENDP
    END MAIN             
    
    ;AHNAF SAYED 18-36920-1