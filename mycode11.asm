.MODEL SMALL

.STACK 100H

.DATA
    ;WELCOME MASSAGES
.CODE 
    MAIN PROC
        ;SHOW WELCOME MASSAGES
        ;LOAD DATA SEGMENTS ETC
        
        XOR BX, BX
        MOV AH, 1
        INT 21H
        
        WHILE_: 
            CMP AL, 0DH
            JE EXITTODOS
            AND AL, 0FH
            
            SHL BX, 1
            OR BL, AL
             
            INT 21H ;READ A CHARACTER
            JMP WHILE_
                      
                      
            ;NOW OUTPUT THE BINARY INPUT
            OUTPUTBINARY:
            
            
            
         ;EXIT TO DOS
         EXITTODOS:
             MOV AX, 4CH
             INT 21H
      MAIN ENDP
    
      END MAIN 
      
      
      
      ;AHNAF SAYED 18-36920-1