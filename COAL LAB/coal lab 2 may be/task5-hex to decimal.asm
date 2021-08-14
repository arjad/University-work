.MODEL SMALL
.STACK 100H
.DATA
      CHAR1 DB ?	  
	  MSG1 DB 'ENTER A HEX DIGIT : $'
	  MSG2 DB 'IN DECIMAL IT IS : $'
.CODE
      MAIN PROC
	      MOV AX,@DATA
          MOV DS,AX              
          
		  MOV DX,OFFSET MSG1 ;PRINT MSG1
		  MOV AH,09H
		  INT 21H 
		  
		  MOV AH,1           ;INPUT NUM1
		  INT 21H
		  MOV CHAR1,AL         
		  
		  MOV DX ,10         ;NEXT LINE
		  MOV AH ,2
		  INT 21H    		  
		  MOV DX,13  
		  MOV AH,2
		  INT 21H 
		  
		  SUB CHAR1,11H
		 		  
		  MOV DX,OFFSET MSG2 ;PRINT MSG2
		  MOV AH,09H
		  INT 21H
		  
		  MOV AH,2           ;OUTPUT 1
		  MOV DL,'1'
		  INT 21H
		                     ;OUTPUT2
		  MOV AH,2
		  MOV DL,CHAR1
		  INT 21H
		 
	      MOV AH,4CH
		  INT 21H
	  
	  MAIN ENDP
	  
END MAIN	  




	  
	  