  .MODEL SMALL
 .STACK 100H
 .DATA
   MSG_1 DB 'Enter first capital letter  :  $'
   MSG_2 DB 'Enter second capital letter :  $\'
   MSG_3 DB 'In alphabetical order : $\'
 .CODE
   MAIN PROC
   MOV AX, @DATA     
   MOV DS, AX
    
     MOV AH, 9      ;output
     MOV DX, OFFSET MSG_1
     INT 21H
          
     MOV AH, 1      ;input
     INT 21H                                        
     MOV BL, AL 
     
     MOV DX,10      ;next line
     MOV AH,2
     INT 21H
     MOV DX,13
     MOV AH,2
     INT 21H
     
     MOV AH, 9      ;output
     MOV DX, OFFSET MSG_2
     INT 21H
            
     MOV AH, 1      ;input function
     INT 21H                                        
     MOV BH, AL           

     MOV DX,10      ;next line
     MOV AH,2
     INT 21H
     MOV DX,13
     MOV AH,2
     INT 21H
     
     MOV AH, 9      ;output
     MOV DX, OFFSET MSG_3
     INT 21H

     MOV AH, 2      ;output function

         CMP BL, BH
         JAE GREAT
       MOV DL, BL
       INT 21H

       MOV DL, BH
       INT 21H

       JMP ENDL

     GREAT:
       MOV DL, BH
       INT 21H

       MOV DL, BL
       INT 21H

     ENDL:

   MOV AH, 4CH      
   INT 21H
   MAIN ENDP
 END MAIN