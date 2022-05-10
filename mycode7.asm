.MODEL SMALL
.STACK 100H
.CODE        
    MAIN PROC
        ;INITIALIZE COUNTER
        MOV CX, 26
        
        MOV BL, 65   ;PRINT ALL THE CHARACTERS IN ASCII/KBD
        MOV AH, 2;SINGLE CHAR OUTPUT
        
        PRINT_LOOP:
            MOV DL, BL
            INT 21H
           
            MOV DL, 10
            INT 21H
            
            MOV DL, 13
            INT 21H
            
            INC BL
            DEC CX
            
            
            JNZ PRINT_LOOP
            
            
        MOV BL, 65
        MOV AH, 2

        
        
        ;DOS EXIT ROUTINE
        MOV AX, 4CH
        INT 21H
    MAIN ENDP
    END MAIN  
    
    
    
         
    ;AHNAF SAYED  18-36920-1