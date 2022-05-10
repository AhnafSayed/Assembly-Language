.MODEL SMALL
.STACK 100H
.DATA 
    WELCOMEMSG DB 'HELLO WORLD $'

.CODE
    MAIN PROC 
        
        MOV AH, 9
        LEA DX, PROMPT
        INT 21H
        
        PROMPT DB 'HELLO UNIVERSE HOW ARE YOU!' 0DH, 0AH, '$'
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, WELCOMEMSG
        MOV AH, 9
        INT 21H
        
        
        
    TOP: 
        MOV CX, 80
        MOV AH, 2
        MOV DL, '*'
        
        TOP:
           INT 21H
           LOOP TOP
      
        EXITTODOS:
            MOV AX, 4CH
            INT 21H
     MAIN ENDP
    
     END MAIN    
     
     
     ;AHNAF SAYED 18-36920-1