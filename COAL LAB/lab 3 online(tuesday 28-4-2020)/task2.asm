.MODEL SMALL
.STACK 100H
.DATA 
      MSG_1 DB 'ENTER A  NUMBER : $'
	  MSG_2 DB 'Number is not greater than 5 $'
      NUM DB ?
	  A DB ?
.CODE
    MAIN PROC
	  MOV AX,@DATA
      MOV DS,AX
            
          MOV AH,09H
		  MOV DX,OFFSET MSG_1;output
		  INT 21H 
		  
		  MOV AH,1   ;input
		  INT 21H
		  MOV BL,AL
		  
		  MOV DX,10  ;next line
		  MOV AH,2
		  INT 21H
		  MOV DX,13
		  MOV AH,2
		  INT 21H
		  
        WHILE:
            CMP BL,'5'
            JG THEN
            JL THEN2
            
        THEN:
            ;MOV AH,1
            ;INT 21H
            MOV A,BL
            
            SUB A,47D
            
            MOV CL,A ;CX=10
            MOV AH,2 ;output
            MOV DL,48;DL=0		  
		 
		 
		 @LOOP:
		    INT 21H  ;print char DL
		    
		    INC DL   ;inc to next asci
		    DEC CL    ;dec CL
		    JNZ @LOOP ;jump to @loop
		    
		    JMP ENDL
		        
		 THEN2:
		    MOV AH,9
		    MOV DL,OFFSET MSG_2
		    INT 21H
		    JMP ENDL
		    
		 ENDL:
		  
		  
	MOV AH,4CH
	INT 21H 	  
  MAIN ENDP 	  
END MAIN			  
		  
		  