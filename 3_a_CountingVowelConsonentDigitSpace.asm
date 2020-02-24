INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.DATA
    vowel DB 'A','E','I','O','U','a','e','i','o','u'
    consonant DB 'B','C','D','F','G','H','J','K','L','M','N','P','Q','R','S','T','V','W','X','Y','Z','b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'
    digit DB '0','1','2','3','4','5','6','7','8','9'
    
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
            
            CALL CHECK_VOWEL
            CMP mark,'v'
            JE IS_VOWEL
            
            CALL CHECK_CONSONANT
            CMP mark,'c'
            JE IS_CONSONANT
            
            CALL CHECK_DIGIT
            CMP mark,'d'
            JE IS_DIGIT
            
            CALL CHECK_SPACE
            CMP mark,'s'
            JE IS_SPACE           
            
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
    
    CHECK_VOWEL PROC
        MOV size,10
        MOV SI,0
        FOR_VOWEL:
            CMP AL, vowel[SI]
            JE GOT_VOWEL
            
            DEC size
            CMP size,0
            JE ENDFOR_VOWEL
                       
            INC SI
            JMP FOR_VOWEL
        ENDFOR_VOWEL:    
            RET
        GOT_VOWEL:
            MOV mark, 'v'
            RET
    CHECK_VOWEL ENDP
    
    CHECK_CONSONANT PROC
        MOV size,42
        MOV SI,0
        FOR_CONSONANT:
            CMP AL, consonant[SI]
            JE GOT_CONSONANT
            
            DEC size
            CMP size,0
            JE ENDFOR_CONSONANT
                       
            INC SI
            JMP FOR_CONSONANT
        ENDFOR_CONSONANT:    
            RET
        GOT_CONSONANT:
            MOV mark, 'c'
            RET
    CHECK_CONSONANT ENDP
    
    CHECK_DIGIT PROC
        MOV size,10
        MOV SI,0
        FOR_DIGIT:
            CMP AL, digit[SI]
            JE GOT_DIGIT
            
            DEC size
            CMP size,0
            JE ENDFOR_DIGIT
                       
            INC SI
            JMP FOR_DIGIT
        ENDFOR_DIGIT:    
            RET
        GOT_DIGIT:
            MOV mark, 'd'
            RET
    CHECK_DIGIT ENDP
    
    CHECK_SPACE PROC
        CMP AL, 20H
        JE GOT_SPACE
        
        RET
        
        GOT_SPACE:
            MOV mark, 's'
            RET
    CHECK_SPACE ENDP
    
END MAIN