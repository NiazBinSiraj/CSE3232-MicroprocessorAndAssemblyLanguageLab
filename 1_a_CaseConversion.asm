INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA
    str DB 80 DUP ?
    n DB ?

.CODE
    MAIN PROC
        
    PRINT "Enter The String : "
    
    MOV n, 0
    MOV SI, 100
    
    INPUT:
        MOV AH, 1;
        INT 21H
        CMP AL, 13
        JE ENDINPUT
        
        IF:
            CMP AL, 65
            JL ELSEIF
            CMP AL, 90
            JG ELSEIF
            
            ADD AL, 32
            JMP ELSE
            
        ELSEIF:
            CMP AL, 97
            JL ELSE
            CMP AL, 122
            JG ELSE
            
            SUB AL, 32
            
        ELSE:
        MOV str[SI],AL;
        
        INC SI;
        INC n;
        JMP INPUT
        
    ENDINPUT:   
    CALL NEWLINE
    
        
    PRINT "RESULT : "
    
    MOV SI, 100    
    OUTPUT:
        MOV AH,2
        MOV DL, str[SI]
        INT 21H
        
        DEC n
        CMP n, 0
        JE ENDOUTPUT
        
        INC SI
        JMP OUTPUT    
        
    ENDOUTPUT:    
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
    
    
    NEWLINE PROC
        MOV AH, 2
        MOV DL, 10
        INT 21H
        MOV DL, 13   
        INT 21H
        RET
    NEWLINE ENDP
    
    
END MAIN    