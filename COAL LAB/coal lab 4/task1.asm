.MODEL SMALL
.STACK 100H
.DATA
      CHAR1 DB ? 
      A DB ?
	  MSG DB 'ENTER CHARACTER : $' 
	  MSG2 DB 'YOU ENTERED A NUMBER $' 
	  MSG3 DB 'YOU ENTERED A CAPITAL LETTER $' 
	  MSG4 DB 'YOU ENTERED A LOWER LETTER $' 
	  MSG5 DB 'YOU ENTERED A SPECIAL CHARACTER $' 
.CODE
      MAIN PROC
	      MOV AX,@DATA
          MOV DS,AX
            
            
		  MOV DX,OFFSET MSG  ;PRINT MSG
		  MOV AH,09H
		  INT 21H
		  
		  MOV AH,1           ;INPUT
		  INT 21H
		  MOV A,AL    
		  
		  MOV DX,10         ;ENTER CODE
		  MOV AH,2
		  INT 21H
		  MOV DX,13
		  MOV AH,2
		  INT 21H
	
	C1:
          CMP A,30H
          JGE C2  
          JMP E
                    
    C2:   
          CMP A,39H
          JLE THEN1  
          JMP E
          
    THEN1:     
		  MOV DX,OFFSET MSG2 ;PRINT MSG 2
		  MOV AH,09H
		  INT 21H
		   
		  JMP E
		  
	E:    
	C3:
          CMP A,41H
          JGE C4  
          JMP E2
                    
    C4:   
          CMP A,5AH
          JLE THEN2  
          JMP E2
          
    THEN2:     
		  MOV DX,OFFSET MSG3 ;PRINT MSG3
		  MOV AH,09H
		  INT 21H
		   
		  JMP E2
		  
	E2:    
	C5:
          CMP A,61H
          JGE C6  
          JMP E3
                    
    C6:   
          CMP A,7AH
          JLE THEN3  
          JMP E3
          
    THEN3:     
		  MOV DX,OFFSET MSG4 ;PRINT MSG4
		  MOV AH,09H
		  INT 21H
		   
		  JMP E3
		  
	E3:	
	C7:
          CMP A,20H
          JGE C8  
          JMP E4
                    
    C8:   
          CMP A,2FH
          JLE THEN4  
          JMP E4
          
    THEN4:     
		  MOV DX,OFFSET MSG5 ;PRINT MSG5
		  MOV AH,09H
		  INT 21H
		   
		  JMP E4
		  
	E4:
	           		 
	      MOV AH,4CH
		  INT 21H  	  
	  MAIN ENDP 	  
END MAIN	  




	  
	  
