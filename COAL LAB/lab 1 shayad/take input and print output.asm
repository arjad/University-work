.MODEL SMALL
.STACK 100H
.DATA
    NUM1 DB ?
    NUM2 DB ? 
    SUM DB ?


.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS,AX
        
        MOV AH,1   ;Taking INPUT
        INT 21H 
        
        MOV AH,2   ;PrintingOUTPUT
        MOV DL, AL          
        INT 21h   
        
               
        
        MOV AH,2CH
        INT 21H
    MAIN ENDP
END MAIN