INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    divisor DB ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS,AX
        
        MOV divisor, 2
        
        PRINT 'Enter an integer between 0 to 9 : '
        
        MOV AH,1
        INT 21H
        
        SUB AL,48
        
        DIV divisor
        
        CMP AH,0
        JE IS_EVEN
        
        JMP IS_ODD
        
        IS_EVEN:
            CALL NEWLINE
            PRINT 'It is Even.'
            JMP EXIT
        
        IS_ODD:
            CALL NEWLINE
            PRINT 'It is Odd.'
            
            
        EXIT:
        
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