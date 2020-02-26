INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA
    str DB 80 DUP ?
    size DB ?
    m DB ?
    n DB ?
    max DB ?
    min DB ?
    pos DW ?
    
.CODE
    MAIN PROC
        PRINT 'Enter the string : '
        
        MOV size,0
        MOV SI,400
        INPUT:
            MOV AH,1
            INT 21H
            
            CMP AL,13
            JZ ENDINPUT
            
            MOV str[SI],AL
            INC SI
            INC size
            
            JMP INPUT
            
        ENDINPUT:
        
        CALL ASORT
        
        CALL NEWLINE
        
        PRINT 'Sorted String : '
        
        MOV SI,400
        MOV n,0
        OUTPUT:
            MOV BL,n
            CMP BL,size
            JE ENDOUTPUT
            
            MOV AH,2
            MOV DL, str[SI]
            INT 21H
            
            INC SI
            INC n
            
            JMP OUTPUT
        ENDOUTPUT:
        
        
        MOV AH,4CH
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
    
    
    ASORT PROC
        MOV SI,400
        MOV m,0
        AFOR:
            MOV BL, size
            CMP m,BL
            JE ENDAFOR
            
            MOV BL, str[SI]
            MOV min,BL
            MOV pos,SI
            MOV DI,SI
            INC DI
            MOV BL,m
            MOV n,BL
            INC n
            ANFOR:
                MOV BL, size
                CMP n,BL
                JE ENDANFOR
                
                MOV BL, min
                CMP str[DI],BL
                JL NEWMIN
                JMP CONTA
                
                NEWMIN:
                    MOV BL, str[DI]
                    MOV min,BL
                    MOV pos,DI
                CONTA:
                    INC DI    
                    INC n
                JMP ANFOR
            ENDANFOR:
            
            MOV DI,pos
            MOV BL, str[DI]
            XCHG str[SI], BL
            MOV str[DI], BL
            
            INC m
            INC SI
            JMP AFOR
        ENDAFOR:
        RET
    ASORT ENDP
    
    
    
    
    DSORT PROC
        MOV SI,400
        MOV m,0
        DFOR:
            MOV BL, size
            CMP m,BL
            JE ENDDFOR
            
            MOV BL, str[SI]
            MOV max,BL
            MOV pos,SI
            MOV DI,SI
            INC DI
            MOV BL,m
            MOV n,BL
            INC n
            DNFOR:
                MOV BL, size
                CMP n,BL
                JE ENDDNFOR
                
                MOV BL, max
                CMP str[DI],BL
                JG NEWMAX
                JMP CONTD
                
                NEWMAX:
                    MOV BL, str[DI]
                    MOV max,BL
                    MOV pos,DI
                CONTD:
                    INC DI    
                    INC n
                JMP DNFOR
            ENDDNFOR:
            
            MOV DI,pos
            MOV BL, str[DI]
            XCHG str[SI], BL
            MOV str[DI], BL
            
            INC m
            INC SI
            JMP DFOR
        ENDDFOR:
        RET
    DSORT ENDP
    
END MAIN