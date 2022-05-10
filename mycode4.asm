.MODEL
.STACK 100H
.DATA
    MSG1 DB 0AH , 0DH, 'THE SUM OF '                    ;AHNAF SAYED 18-36920-1
    NUM1 DB ?
    MSG2 DB ' AND '
    NUM2 DB ?
    MSG3 DB ' IS '
    SUM DB ?
    MSGLAST DB '$'
.CODE
    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AH, 1
    INT 21H
    MOV NUM1, AL
    
    
    INT 21H
    MOV NUM2, AL
    MOV BL, NUM2
    
    
    ADD BL, NUM1 
    MOV SUM, BL 
    SUB SUM, 30H
    
    
    
    MOV AH, 9
    LEA DX, MSG1
    INT 21H
    
    
    MOV AX, 4CH
    INT 21H 
    
    
    MAIN ENDP
    END MAIN