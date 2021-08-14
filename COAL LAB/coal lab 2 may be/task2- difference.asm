.MODEL SMALL
.STACK 100H
.DATA
     NUM1 DB ?
     NUM2 DB ?  
     SB DB ?
     MSG1 DB 'ENTER YOUR FIRST DIGIT : $'
     MSG2 DB 'ENTER YOUR SECOND DIGIT : $'
     MSG3 DB 'THE DIFFERENCE IS : $'

.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
               MOV DX, OFFSET MSG1 ;PRINT MSG1
               MOV AH,9
               INT 21H
               
               MOV AH,1            ;INPUT NO 1
               INT 21H  
               SUB AL,30H
               MOV NUM1,AL        
                                   
               MOV DX,10           ;NEXT LINE
               MOV AH,2
               INT 21H
               MOV DX,13
               MOV AH,2
               INT 21H
                   
               MOV DX, OFFSET MSG2 ;PRINT MSG2
               MOV AH,9
               INT 21H
                   
               MOV AH,1            ;INPUT NO 2
               INT 21H   
               SUB AL,30H
               MOV NUM2,AL  
               
               MOV DX,10           ;NEXT LINE
               MOV AH,2
               INT 21H
               MOV DX,13
               MOV AH,2
               INT 21H  
               
               MOV DX, OFFSET MSG3 ;PRINT MSG3
               MOV AH,9
               INT 21H
        
               MOV AH, NUM1
               SUB AH,NUM2
               MOV SB,AH          ;SUBTRACTING
               ADD SB,30H 
               
               MOV AH,2            ;PRINT SUBTRACT
               MOV DL,SB
               INT 21H
                  
                  
                  
        
        
        MOV AH,4CH
        INT 21H        
    MAIN ENDP
END MAIN
    