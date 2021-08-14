.MODEL SMALL 
.STACK 100H 
.DATA         
    NUM DB ?
    MSG1 DB 'Enter stack string : $'
    MSG2 DB 'The reverse stack string : $'
    

.CODE 
MAIN PROC FAR 
    MOV AX,@DATA 
    MOV DS,AX        
      
      MOV AH,9          ;output  1
      MOV DX,OFFSET MSG1
      INT 21H
      
      XOR DX,DX
      
      MOV CX,17
      L:                 ;iutput loop
            MOV AH,1
            INT 21H
            
            MOV NUM,AL
            MOV DL,NUM
            MOV DH,0
            
            PUSH DX            
      LOOP L
      
      MOV DX,10      ;ENTER CODE
      MOV AH,2
      INT 21H
      MOV DX,13
      MOV AH,2
      INT 21H
      
      MOV AH,9          ;output 2
      MOV DX,OFFSET(MSG2)
      INT 21H
      
       XOR CX,CX
       MOV CX,17 
      L2:               ;OUTPUT LOOP
            POP BX
            
            MOV AH,2
            MOV DL,BL
            INT 21H
            
      LOOP L2  
        
      MOV DX,10      ;ENTER CODE
      MOV AH,2
      INT 21H
      MOV DX,13
      MOV AH,2
      INT 21H  
        
        
         
     

    MOV AH, 4CH 
    INT 21H     
MAIN ENDP 
END MAIN 
