INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.DATA
    str DB 80 DUP ?
    n DB ?

.CODE
    MAIN PROC
        
        MOV n,0
 
        PRINT "Enter The String : "
        
        MOV SI,100
        INPUT:
            MOV AH,1
            INT 21H
            
            CMP AL,13
            JZ ENDINPUT
            
            MOV str[SI], AL
            
            INC n
            INC SI
            JMP INPUT
                                    
        ENDINPUT:
            CALL NEWLINE
            PRINT "Reversed String : "
            DEC SI
        OUTPUT:
            MOV AH,2
            MOV DL, str[SI]
            INT 21H
            
            DEC n
            CMP n,0
            JE ENDOUTPUT
            DEC SI
            JMP OUTPUT
            
        ENDOUTPUT:
        
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
    
    
    NEWLINE PROC
        MOV AH,2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
        RET
    NEWLINE ENDP

END MAIN