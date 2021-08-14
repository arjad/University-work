.MODEL SMALL
.STACK 100H
.DATA
      NUM DW ?
	  MSG DB 'enter no$'
.CODE
      MAIN PROC
	      MOV AX,@DATA
          MOV DS,AX
            
            
		  MOV DX,OFFSET MSG;PRINT MSG1
		  MOV AH,09H
		  INT 21H
		  
		  MOV AH,1
		  INT 21H
		  SUB AX,30H
		  MOV NUM,AX
		  
          MOV AH,0AH ;enter
          MOV DX,SI
          INT 21H
		  
		  MOV DX ,10 
		  MOV AH ,2
		  INT 21H
		  
		  MOV DX,13  
		  MOV AH,2
		  INT 21H
		  
		  MOV CX,NUM
	L1:	  MOV AH,2     ;LOOP
	      MOV DL,'*'
		  INT 21H
		 
		  LOOP L1
	   
		 
	      MOV AH,4CH
		  INT 21H
	  
	  MAIN ENDP
	  
END MAIN	  




	  
	  
