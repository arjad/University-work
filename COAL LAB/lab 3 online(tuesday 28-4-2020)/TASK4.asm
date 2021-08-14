.MODEL SMALL
.STACK 100H
.DATA 
      MSG_1 DB 'ENTER A NUMBER (0-9) : $'
	  MSG_2 DB 'Your input is incorrect $'
      NUM DB ?
	  I DB 1
	  J DB 1
.CODE
    MAIN PROC
	  MOV AX,@DATA
      MOV DS,AX
            
          MOV AH,09H
		  MOV DX,OFFSET MSG_1;output
		  INT 21H 
		  		  
		  MOV AH,1          ;input
		  INT 21H 
		  SUB AL,30H
		  MOV NUM,AL		                        
		  
		  MOV DX ,10        ;next line
		  MOV AH ,2
		  INT 21H            		  
		  MOV DX,13
		  MOV AH,2
		  INT 21H 
		 		 
		  MOV BL,NUM 
     IF:   
             CMP NUM,0      ;condition
		     JGE AND_CONDITION  
		     JMP ELSE
		  
     AND_CONDITION:
             CMP NUM,9      ;condition2
             JLE  WHILE 
             JMP ELSE
               
     WHILE:
             CMP I,BL
             JLE INNER_WHILE
             JMP ENDL
	       	        
        INNER_WHILE: 
             CMP J,BL
             JLE OUTPUT
		     JMP END_INNER
		   
        OUTPUT: 
             MOV AH,2  ;print #  
             MOV DL,'#'
		     INT 21H
	    		  
		     INC J
		     JMP INNER_WHILE
		   		  			  
	    END_INNER:   
	      INC I 
		 
		  MOV DX ,10    ;next line code
		  MOV AH ,2
		  INT 21H
		  MOV DX,13   
		  MOV AH,2
		  INT 21H 
		  
		  MOV J,1;
		  JMP WHILE

	ELSE:  
	      MOV DX,OFFSET MSG_2;output
		  MOV AH,09H
		  INT 21H 
	         
    ENDL:
    	

	MOV AH,4CH
	INT 21H 	  
  MAIN ENDP 	  
END MAIN	  