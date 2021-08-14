.MODEL SMALL
.STACK 100H
.DATA  

    NUM DB ?
    MSG1 DB 'Min is : $'
    MSG2 DB 'Max is : $'
    
    MAX DB 40H 
    MIN DB 70H

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

        MOV CX,5   ;initiate loop  
    @LP_1:
        MOV AH,1   ;input
        INT 21H
        
        MOV NUM,AL
        MOV DL,NUM
        MOV DH,00H 
        
        PUSH DX    ;putting in stack
         
    LOOP @LP_1
 
             
 
        MOV CX,5
    @LP_2:
 
        POP BX     ;popping from stack and put in BX
        IFF:  
     
        CMP BL,MIN
        JL COND1
        JMP COND2         

        COND1:      		  
      		  
      		MOV MIN,BL
      		      
      		  
  
        COND2:   
        CMP BL,MAX
        JG QUIT
        JMP END

        QUIT:       
      		  
      		  MOV MAX,BL	  
      		 
        END:   		  

    LOOP @LP_2    
              
      MOV DX,10      ;ENTER CODE
      MOV AH,2
      INT 21H
      MOV DX,13
      MOV AH,2
      INT 21H 
      
              MOV AH,9          ;print msg1
              MOV DX,OFFSET MSG1
              INT 21H
              
              MOV DL,MIN
      		  MOV AH,2
      		  INT 21H 
      		  
                
      		  
      MOV DX,10      ;ENTER CODE
      MOV AH,2
      INT 21H
      MOV DX,13
      MOV AH,2
      INT 21H    
      
              MOV AH,9        ;print msg2
              MOV DX,OFFSET(MSG2)
              INT 21H
              
              MOV DL,MAX          
      		  MOV AH,2
      		  INT 21H   
  

    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN