.MODEL SMALL
.STACK 100H
.DATA
      CHAR1 DB ?
      CHAR2 DB ?
      CHAR3 DB ?  
      MSG DB 'ENTER THREE INITIALS : $'  
      MSG1 DB 'FIRST NAME INITIAL : $'  
      MSG2 DB 'MIDDLE NAME INITIAL : $'
      MSG3 DB 'LAST NAME INITIAL : $'

.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
           
        MOV AH,9       ;PRINT MSG
        MOV DX,OFFSET MSG   
        INT 21H
        
        MOV AH,1       ;input
        INT 21H 
        MOV CHAR1,AL   
        
        MOV AH,1       ;input
        INT 21H 
        MOV CHAR2,AL
             
        MOV AH,1       ;input
        INT 21H
        MOV CHAR3,AL  
        
        MOV DX,10      ;NEXT LINE
        MOV AH,2
        INT 21H
        MOV DX,13
        MOV AH,2
        INT 21H
        
        MOV AH,9          ;PRINT MSG1
        MOV DX,OFFSET MSG1   
        INT 21H
        
        MOV AH,2       ;output
        MOV DL,CHAR1
        INT 21H
        
        MOV DX,10      ;NEXT LINE
        MOV AH,2
        INT 21H
        MOV DX,13
        MOV AH,2
        INT 21H
        
        MOV AH,9          ;PRINT MSG2
        MOV DX,OFFSET MSG2   
        INT 21H
         
        MOV AH,2       ;output
        MOV DL,CHAR2  
        INT 21H
        
        MOV DX,10      ;NEXT LINE
        MOV AH,2
        INT 21H
        MOV DX,13
        MOV AH,2
        INT 21H
        
        MOV AH,9          ;PRINT MSG3
        MOV DX,OFFSET MSG3   
        INT 21H
        MOV AH,2       ;output
        MOV DL,CHAR3
        INT 21H 
        
        
        MOV AH,4CH
        INT 21H        
    MAIN ENDP
END MAIN