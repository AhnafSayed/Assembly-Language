;.MODEL SMALL

;.STACK 100H

;.DATA
;    MYNUM DB 10
    
    
;.CODE
;    MAIN PROC 
;        MOV AX, @DATA
;        MOV DS, AX 
;        MOV AX, 0DH
;        INT 21H
;    MAIN ENDP
;    END MAIN 
    
    
    
;.MODEL SMALL

;.STACK 100H

;.DATA
;    HELLOMSG DB 'HELLO UNIVERSE! $'  
;    MYNAME   DB 'My name is Ahnaf Sayed $'
    
    
;.CODE
;    MAIN PROC 
;        MOV AX, @DATA
;        MOV DS, AX
;        MOV AH, 9
;        LEA DX, HELLOMSG
;        INT 21H
;        LEA DX, MYNAME 
;        INT 21H
;        MOV AX, 0DH 
;        INT 21H
;    MAIN ENDP                                                                                             
;    END MAIN 
    
    
.MODEL SMALL

.STACK 100H

.DATA
    MYNUM DB 10
    
    
.CODE
    MAIN PROC 
       MOV AH, 2
       MOV DL, 'A'
       INT 21H
       MOV AH, 1
       INT 21H
       MOV BL, AL
       MOV AH, 2
       MOV DL, 0DH
       INT 21H
       MOV DL, 0AH
       INT 21H
       MOV DL, BL
       INT 21H
       MOV AH, 4CH 
       INT 21H
    MAIN ENDP
    END MAIN