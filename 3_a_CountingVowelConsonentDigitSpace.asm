INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.DATA
    vc DB ?
    cc DB ?
    dc DB ?
    sc DB ?
    
    mark DB ?
    size DB ?
    
    
.CODE
    MAIN PROC
        
        PRINT "Enter The String : "
        
        MOV vc,0
        MOV cc,0
        MOV dc,0
        MOV sc,0
        MOV mark, 'u'
        
        INPUT:
            MOV AH,1
            INT 21H
            
            CMP AL,13
            JZ ENDINPUT
            
            CMP AL, 32
            JE IS_SPACE
            
            CMP AL, 'A'
            JE IS_VOWEL
            
            CMP AL, 'E'
            JE IS_VOWEL
            
            CMP AL, 'I'
            JE IS_VOWEL
            
            CMP AL, 'O'
            JE IS_VOWEL
            
            CMP AL, 'U'
            JE IS_VOWEL
            
            CMP AL, 'a'
            JE IS_VOWEL
            
            CMP AL, 'e'
            JE IS_VOWEL
            
            CMP AL, 'i'
            JE IS_VOWEL
            
            CMP AL, 'o'
            JE IS_VOWEL
            
            CMP AL, 'u'
            JE IS_VOWEL
            
            
            CMP AL, '0'
            JL  CHECK_CAPITAL
            
            CMP AL, '9'
            JG  CHECK_CAPITAL
            
            JMP IS_DIGIT
            
            CHECK_CAPITAL:
                CMP AL, 'A'
                JL INPUT
                
                CMP AL, 'Z'
                JG CHECK_SMALL
                
                JMP IS_CONSONANT
                
            CHECK_SMALL:
                CMP AL, 'a'
                JL INPUT
                
                CMP AL, 'z'
                JG INPUT
                
                JMP IS_CONSONANT
                                            
            JMP INPUT
            
            IS_VOWEL:
                INC vc
                JMP INPUT
                
            IS_CONSONANT:
                INC cc
                JMP INPUT
            
            IS_DIGIT:
                INC dc
                JMP INPUT
                
            IS_SPACE:
                INC sc
                JMP INPUT
            
            
        ENDINPUT:
            CALL NEWLINE
            
            
        ADD vc,48
        ADD cc,48
        ADD dc,48
        ADD sc,48
        
        PRINT "Vowel : "        
        MOV AH,2
        MOV DL,vc
        INT 21H
        CALL NEWLINE
        
        PRINT "Consonant : "        
        MOV AH,2
        MOV DL,cc
        INT 21H
        CALL NEWLINE
        
        PRINT "Digit : "        
        MOV AH,2
        MOV DL,dc
        INT 21H
        CALL NEWLINE
        
        PRINT "Space : "        
        MOV AH,2
        MOV DL,sc
        INT 21H
        
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
    
END MAIN