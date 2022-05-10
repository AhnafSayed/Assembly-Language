.MODEL SMALL

.STACK 100H

.DATA
    ;WELCOME MASSAGES AND OTHER VARIABLES 
    WELCOMEMSG DB 'WELCOME TO PROC PROGRAM$'
    SECONDMSG DB 'MY NAME IS AHNAF$'
    
.CODE 
    MAIN PROC
        ;SHOW WELCOME MASSAGE AND THE SECOND MASSAGE ON SEPARATE LINE
        MOV AX, @DATA
        MOV DS, AX
        ;WELCOME MASSAGE
        MOV AH, 9
        LEA DX, WELCOMEMSG
        INT 21H
        ;PRINT NEWLINE
        CALL NEWLINE
        ;NOW PRINT SECOND MASSAGE
        MOV AH, 9
        LEA DX, SECONDMSG
        INT 21H
        ;NOW OTHER STUFFS        ;AHNAF SAYED 18-36920-1
        MOV AX, 25
        MOV BX, 4
        CALL MULTIPLY
        
        ;EXIT TO DOS LABEL
        EXITTODOS:
            MOV AX, 4CH
            INT 21H
    MAIN ENDP
        ;OTHER PROCEDURES/FUNCTIONS
        ;MULTIPLY PROC 
        MULTIPLY PROC
            PUSH AX
            PUSH BX
            XOR DX, DX
            
            REPEAT:
                TEST BX, 1
                JZ END_IF
                ADD DX, AX
            END_IF:
                SHL AX, 1
                SHR BX, 1
                JNZ REPEAT
                
                POP BX
                POP AX
            RET
        
        MULTIPLY ENDP
        
        
        ;NEWLINE PROC 
        NEWLINE PROC
            MOV AH, 2
            MOV DL, 0DH
            INT 21H
            ;LINEFEED
            MOV DL, 0AH
            INT 21H
            RET
        NEWLINE ENDP
    END MAIN     
    
    
    