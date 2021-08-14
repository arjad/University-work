.MODEL SMALL
.STACK 100H
.DATA    
       A DB ?
       MSG DB 'after SHL : $ '
.CODE
   MAIN PROC
	  MOV AX,@DATA
      MOV DS,AX    
      
        STC
        
        MOV AL,10001011B
        SHL AL,1
        MOV A,AL
        
        XOR CX,CX  ;RESET CX
        MOV CX,8  ;initiate loop 8 times  
        
        
        
    @LOOP1:      
    
		CONDITION1:
		SHL A,1
		JC CONDITION2
		JMP CONDITION3
		                       
		                       
		  MOV DX,OFFSET MSG  ;PRINT MSG
		  MOV AH,09H
		  INT 21H 
		
		CONDITION2:
		MOV AH,2      ;print 1
		MOV DL,'1'
		INT 21H
		
		JMP @QUIT
		
		CONDITION3:
		MOV AH,2      ;print 0
		MOV DL,'0'
		INT 21H
		
		@QUIT:   
	LOOP @LOOP1	        ;end loop
		   
		     
	 MOV AH,4CH
     INT 21H
 MAIN ENDP 	  
END MAIN