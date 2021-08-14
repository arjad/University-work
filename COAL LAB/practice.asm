.MODEL SMALL
.DATA       
    A DB ?
    AA DB ?
.STACK 100H
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
       
        
        MOV DX,01101101B
        MOV CX,8
        @L1:
            ROL DH,1
            JC @P1
            JMP @P0
        @P1:
            MOV AH,2
            MOV DL,'1'
            INT 21H
            
            JMP EN
       @P0:
            MOV AH,2
            MOV DL,'0'
            INT 21H
            
            JMP EN
       EN:        
          
                  
        MOV AH,4CH
        INT 21H        
    MAIN ENDP
END MAIN 
