.MODEL SMALL
.STACK 100H
.DATA
      NUM1 DB ?
	  NUM2 DB ? 
	  SUM  DB ?
	  S1  DB ?
	  S2  DB ?
	 
.CODE
  MAIN PROC
	      MOV AX,@DATA
          MOV DS,AX
            
          MOV AH,2    ;output ?
          MOV DL,'?'
          INT 21H
		  
		  MOV AH,1   ;input1
		  INT 21H
		  SUB AL,30H
		  MOV NUM1,AL  
		  
		  MOV AH,1   ;input2
		  INT 21H
		  SUB AL,30H
		  MOV NUM2,AL
		 
  
		  MOV AL,NUM1 ;adding
		  MOV BL,NUM2
		  ADD AL,BL   
		  MOV SUM,AL  ;storing
		  SUB AL,BL
		  
	 C1: CMP SUM,9   ;condition
	     JLE IF
	     JMP EN
	 IF: MOV S1,AL
	     MOV S2,BL
	 EN:     
		   
		
	      MOV AH,4CH
		  INT 21H
	  
 MAIN ENDP
	  
END MAIN	  




	  
	  