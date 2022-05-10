.MODEL SMALL
.STACK 100H  

.DATA
    ENTERVAL DB 'Enter your single value: $' 
    YOURVAL  DB 'You value is A $'

.CODE
    MAIN PROC                                                                                ;Name:Ahnaf Sayed  Id:18-36920-1
        
        MOV AX, @DATA
        MOV DS,AX
        
        MOV AH, 9
        LEA DX, ENTERVAL
        INT 21H
        LEA DX, YOURVAL
        INT 21H
        
        MOV AH, 2 ;single character output
        MOV DL, ' '
        INT 21H 
        
        ;ask for input
        MOV AH, 1
        INT 21H
        
        ;collect input 
        MOV BL, AL
        
        ;a newline (Carriage Return)
        MOV AH, 2
        MOV DL,0DH
        INT 21H
        
        ;line feed
        MOV DL,0AH ;new line
        INT 21H
        
        ;output the input character
        MOV AH, 2  
        MOV DL, BL
        INT 21H
        
        
        ;exit to DOS/OS
        MOV AX, 4CH
        INT 21H
        
    MAIN ENDP
    
    END MAIN