.MODEL SMALL
.STACK 100H
.DATA ;if you have variables
  INPUTMSG DB 'Enter a hex degit: $'
  OUTPUTMSG DB 'In Decimal it is $'  
  ERRORMSG DB 'Not Hexadecimal $'
  
.CODE
   MAIN PROC
    ;Load data segment into DS register if you have variables  
    MOV AX, @DATA
    MOV DS,AX
    ;Now show input msg  
    MOV AH,9 ;string output instruction to DOS
    LEA DX,INPUTMSG ;input  prompt
    INT 21H
    
    ;wait for single character input  
    MOV AH,1 
    INT 21H 
    ;now you have the single character in AL 
    ;mov input into another register to keep it safe
    MOV BL,AL 
    ;check the input now if it is between A-F
    ;jump to INVALIDINPUT if the input is wrong 
    ;Check if less than A 
    CMP BL, 'A'
    JL INVALIDINPUT  
    ;check if greater than 'F'
    CMP BL,'B'
    JG INVALIDINPUT
    ;New line (carriage return - line feed)
    MOV AH,2
    MOV DL,0DH ;Carriage return
    INT 21H

    ;line feed
    MOV DL, 0AH
    INT 21H
    ;now show the decimal value of hex digiy 
    LEA DX, OUTPUTMSG
    MOV AH,9
    INT 21H
    ;first show the first digit in decimal which is 1 for all of the hexa digit A-F
    MOV AH, 2  
    MOV DL,'1'
    INT 21H
    
    ;Now to show the second digit. what would that be?
    SUB BL,11H
    MOV DL,BL
    INT 21H  
     
    ;Now jump to EXITTODOS - unconditional jmp
    JMP EXITTODOS
    
    
    INVALIDINPUT:
    ;show error message
    ;New line (carriage return - line feed)
    MOV AH,2
    MOV DL,0DH ;Carriage return
    INT 21H

    ;line feed
    MOV DL, 0AH
    INT 21H
    MOV AH,9
    LEA DX, ERRORMSG
    INT 21H
    
    
    ;Exit to DS
     EXITTODOS:
        MOV AX, 4CH
        INT 21H
    MAIN ENDP
    END MAIN