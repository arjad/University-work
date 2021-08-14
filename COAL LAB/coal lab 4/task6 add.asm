.MODEL SMALL
.STACK 100H
.DATA
   P1 DB 'TYPE A BINARY NO, UP TO 8 DIGITS : $'
   P3 DB 'The binary SUM is : $'
   I DB 'Illegal character. Try again.$'

.CODE
   MAIN PROC
     MOV AX, @DATA               
     MOV DS, AX

  @START2:                    
       XOR BX, BX                

       MOV DX, OFFSET(P1)           ; PRINT P
       MOV AH, 9
       INT 21H

       MOV CX, 8                  ;loop
       MOV AH, 1                  ;input

  @LOOP1:                  ; loop label
         INT 21H                  

         CMP AL, 0DH              ; compare AL with CR
         JNE @SKIP1              
         JMP @E_LOOP1        

   @SKIP1:                
           AND AL, 0FH            ; convert ascii into decimal code
           SHL BL, 1              ; shift BL towards left by 1 position
           OR BL, AL              ; set the LSB of BL with LASB of AL
       LOOP @LOOP1             
                      
       MOV DX,10            ;enter code
       MOV AH,2
       INT 21H
       MOV DX,13
       MOV AH,2
       INT 21H 
   @E_LOOP1:             

      MOV DX, OFFSET(P1)           ; PRINT P
       MOV AH, 9
       INT 21H

       MOV CX, 8               
       MOV AH, 1                  ; input

       @LOOP2:                  
         INT 21H               

         CMP AL, 0DH              ; compare AL with CR
         JNE @SKIP2           
         JMP @E_LOOP2        

         @SKIP2:               
           AND AL, 0FH            ; convert ascii into decimal code
           SHL BH, 1              ; shift BH towards left by 1 position
           OR BH, AL              ; set the LSB of BH with LASB of AL
       LOOP @LOOP2               

       @E_LOOP2:             
       
       MOV DX,10            ;enter code
       MOV AH,2
       INT 21H
       MOV DX,13
       MOV AH,2
       INT 21H         
                
       MOV DX, OFFSET(P3)           ; PRINT P
       MOV AH, 9
       INT 21H

       ADD BL, BH                 ; add BL and BH
       JNC @SKIP  
                    
         MOV AH, 2                ; print the digit 1 i.e. carry
         MOV DL, 31H
         INT 21H

       @SKIP:                  

       MOV CX, 8                  ; loop counter
       MOV AH, 2                  ; output

       @LOOP3:                   
         SHL BL, 1                ; shift BL towards left by 1 position
         JC @ONE                 
         MOV DL, 30H             
         JMP @DISPLAY             ; jump to label @DISPLAY

      @ONE:                   
           MOV DL, 31H          

      @DISPLAY:               
           INT 21H               
       LOOP @LOOP3               
                         
                         
                         
                         
     MOV AH, 4CH               
     INT 21H
   MAIN ENDP
 END MAIN