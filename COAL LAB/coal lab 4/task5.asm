.MODEL SMALL
.STACK 100H
.DATA
      SPACE DW 4
      STAR DW 1 
      SPACE1 DW 1
      STAR1 DW 7
      MSG DB 'ENTER A NUMBER : $'
    	
.CODE
      MAIN PROC
	      MOV AX,@DATA
          MOV DS,AX
                        ;MSG
          MOV AH,9
          MOV DX, OFFSET(MSG)
          INT 21H
          
          MOV AH,1      ;INPUT
          INT 21H
          SUB AL,30H
          
          MOV DX,10     ;ENTER CODE
          MOV AH,2
          INT 21H
          MOV DX,13
          MOV AH,2
          INT 21H
                     
        MOV CX,4
      O:
        MOV BX,CX
        MOV CX,SPACE
                     
      L2:
           MOV DL,32    ;PRINT SPACE
           MOV AH,02
           INT 21H
      
      LOOP L2
            DEC SPACE
            MOV CX,STAR
       L3: 
           MOV DL,'*'
           MOV AH,2
           INT 21H
               
      LOOP L3     
            INC STAR
            INC STAR
            
            MOV DL,0AH
            MOV AH,02
            INT 21H
            MOV DL,0DH
            MOV AH,02
            INT 21H
            
            MOV CX,BX
            
      LOOP O  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;      
       
        MOV CX,4
      O1:
        MOV BX,CX
        MOV CX,SPACE1
                     
      L22:
           MOV DL,32  ;PRINT SPACE
           MOV AH,02
           INT 21H
      
      LOOP L22
            INC SPACE1
            MOV CX,STAR1
       L33: 
           MOV DL,'*'
           MOV AH,02
           INT 21H
               
      LOOP L33     
            DEC STAR1
            DEC STAR1
            
            MOV DL,0AH
            MOV AH,02
            INT 21H
            MOV DL,0DH
            MOV AH,02
            INT 21H
            
            MOV CX,BX
            
      LOOP O1                
      

                             
      	           		 
	      MOV AH,4CH
		  INT 21H  	  
	  MAIN ENDP 	  
END MAIN	  




	  
	  
