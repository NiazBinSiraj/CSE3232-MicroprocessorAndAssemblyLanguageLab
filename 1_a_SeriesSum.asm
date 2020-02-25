INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    divisor DB ?
    sum DB ?
    n DB ?
.CODE
    MAIN PROC
    
    MOV divisor,2
    PRINT 'Enter an integer between 1 to 3 : '
    
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    MOV n,AL
    
    ADD AL,1
    MUL n
    DIV divisor
    
    ADD AL,48
    
    MOV sum,AL
    
    CALL NEWLINE
    PRINT 'SUM = '
    
    
    MOV AH,2
    MOV DL,sum
    INT 21H
    
    
        
        
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
    
    
    NEWLINE PROC
        MOV AH,2
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        RET
    NEWLINE ENDP
    
END MAIN