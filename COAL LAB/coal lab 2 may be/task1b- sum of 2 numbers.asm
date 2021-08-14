.MODEL SMALL
.STACK 100H
.DATA
     NUM1 DB ?
     NUM2 DB ?  
     SUM DB ?

.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
               MOV AH,2        ;PRINT ?
               MOV DL,'?'
               INT 21H
               
               MOV AH,1        ;INPUT NO 1
               INT 21H  
               SUB AL,30H
               MOV NUM1,AL
               
               MOV AH,1        ;INPUT NO 2
               INT 21H   
               SUB AL,30H
               MOV NUM2,AL
        
               MOV AH, NUM1
               ADD AH,NUM2
               MOV SUM,AH
               ADD SUM,30H 
               
               MOV AH,2        ;PRINT SUM
               MOV DL,SUM
               INT 21H
                  
                  
                  
        
        
        MOV AH,4CH
        INT 21H        
    MAIN ENDP
END MAIN
    