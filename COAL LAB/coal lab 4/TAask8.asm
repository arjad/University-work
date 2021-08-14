.MODEL SMALL
.STACK 100H
.DATA    
       A DB ?
       B DB ? 
       C DB ?
          
         
          MSG1 DB 'Enter BINARY NUMBER : $?'       
          MSG DB 'Error    enter only 1 or 0  $?\'
          MSG2 DB 'THE ANSER IS : $'
          MSG3 DB 'Enter 1 to shift right or 0 to shift left:$?\'
          MSG4 DB 'HOW MANY TIME SHIFT LEFT : $?\'
          MSG5 DB 'HOW MANY TIME SHIFT RIGHT : $?\'
.CODE
   MAIN PROC
	  MOV AX,@DATA
      MOV DS,AX    
      
          MOV DX,OFFSET(MSG1) ;print msg
		  MOV AH,09H
		  INT 21H
		  
          MOV CX,8  ;8 times input 
          
         @LOOP1:
          MOV AH,1  ;input
          INT 21H
          MOV BL,AL
		  SUB BL,30H  ;saving in decimal
		  
		 @IFF: CMP BL,1
		    JE @THEN11  
		    JMP @THEN22
		     
		 @THEN22:
		        CMP BL,0
		        JE @THEN11
		        JMP @ELSE 
		        
		 @THEN11:
		  SHL A,1    
		  ADD A,BL
		      
		  JMP @QUIT
		 @ELSE:       
		 
		  MOV DX,OFFSET(MSG) ;print msg
		  MOV AH,09H
		  INT 21H 
		    
		  MOV DX ,10 ;enter  code 
		  MOV AH ,2
		  INT 21H 		  
		  MOV DX,13   
		  MOV AH,2
		  INT 21H
		  
		  MOV AH,1  ;input
          INT 21H
          MOV BL,AL
		  SUB BL,30H 
		 
		  JMP @IFF
		  
		@QUIT:    
		
		   LOOP @LOOP1    ;loop ends
		         
		         
		  MOV DX ,10  ;enter code
		  MOV AH ,2
		  INT 21H
		  MOV DX,13   
		  MOV AH,2
		  INT 21H 
		             
		             
		  MOV DX,OFFSET(MSG3) ;print msg
		  MOV AH,09H
		  INT 21H     
		  
		  MOV AH,1     ;input
          INT 21H
          SUB AL,30H 
          
          MOV B,AL 
          
          @IFF2: 
              CMP B,0
              JE @THEN2
              JMP @THEN3 
              
         @THEN2:  
         
          MOV DX ,10  ;enter code
		  MOV AH ,2
		  INT 21H
		  MOV DX,13   
		  MOV AH,2
		  INT 21H 
		  
          MOV DX,OFFSET(MSG4) ;print msg
		  MOV AH,09H
		  INT 21H
		   
		  MOV AH,1  ;input
          INT 21H   
          
          MOV C,AL
		  SUB C,30H
		  MOV CL,C 
		  SHL A,CL
          JMP @ROLL
         
         @THEN3: 
          MOV DX ,10  ;enter code
		  MOV AH ,2
		  INT 21H
		  MOV DX,13   
		  MOV AH,2
		  INT 21H 
		  
		   
          MOV DX,OFFSET(MSG5) ;print msg
		  MOV AH,09H
		  INT 21H 
		  
		  MOV AH,1
          INT 21H
          MOV C,AL
		  SUB C,30H
		  MOV CL,C 
		  SHR A,CL
          JMP @ROLL
		 @ROLL:
		 
		  MOV DX ,10  ;enter code
		  MOV AH ,2
		  INT 21H
		  MOV DX,13   
		  MOV AH,2
		  INT 21H 
		   
           MOV DX,OFFSET(MSG2) ;print msg
		   MOV AH,09H
		   INT 21H
		    
		  
		 MOV CX,8     ;8 times input
    @LOOP2:
		  SHL A,1 
		  JC @PRINT1
		  JMP @PRINT2
		  
		  @PRINT1:  
		  MOV AH,2    ;print 1
		  MOV DL,'1'
		  INT 21H
		  JMP @BYE
		 
		  @PRINT2:
		  MOV AH,2     ;print 0
		  MOV DL,'0'
		  INT 21H 
		  @BYE:     
		  
	LOOP @LOOP2
		  
		     
	 MOV AH,4CH
     INT 21H
 MAIN ENDP 	  
END MAIN