.MODEL SMALL
.STACK 100H
.DATA
           
   CR EQU 0DH  ; CR REPRESENTS CARRIAGE RETURN
   LF EQU 0AH  ; LF REPRESENTS LINE FEED        
           
   MSG DB CR,LF,'ENTER AN ALGEBRIC EXPRESSION : ',CR,LF,'$'
   MSG_CORRECT DB  CR,LF,'EXPRESSION IS CORRECT.$'
   MSG_LEFT_BRACKET DB  CR,LF,'TOO MANY LEFT BRACKETS. BEGIN AGAIN!',CR,LF,'$'
   MSG_RIGHT_BRACKET DB  CR,LF,'TOO MANY RIGHT BRACKETS. BEGIN AGAIN!',CR,LF,'$'
   MSG_MISMATCH DB  CR,LF,'BRACKET MISMATCH. BEGIN AGAIN!',CR,LF,'$'
   MSG_CONTINUE DB  CR,LF,'TYPE Y IF YOU WANT TO CONTINUE : ',CR,LF,'$'
 
 
 
.CODE  
  MAIN PROC      
   MOV AX,@DATA  
   MOV DS,AX    
 
 
START:
   LEA DX,MSG   ;USER PROMPT                 
   MOV AH,9
   INT 21H  
 
   XOR CX,CX      ;INITIALIZING CX             
   MOV AH,1                
 
 
INPUT:         ;THIS LABEL FOR TAKING INPUT   
 
    INT 21H                
     
    CMP AL,0DH       ;CHECKING IF THE ENTER IS PRESSED OR NOT            
    JE END_INPUT                     
     
    ;IF LEFT BRACKET,THEN PUSH ON STACK
    CMP AL, "["              
           JE PUSH_DATA         
    CMP AL, "{"              
           JE PUSH_DATA           
    CMP AL, "("            
           JE PUSH_DATA
     
     
    ;IF RIGHT BRACKET,THEN POP STACK
                   
    CMP AL, ")"           
           JE PARENTHESES       
    CMP AL, "}"           
           JE CURLY_BRACES          
    CMP AL, "]"            
           JE LINE_BRACKET     
    JMP INPUT
 
 
 
PUSH_DATA: 
    PUSH AX                
    INC CX                  
    JMP INPUT
        
     
     
                    
PARENTHESES:                       
           DEC CX             
           CMP CX,0           
           JL MANY_RIGHT        
            
           POP DX
           CMP DL, "("              
           JNE MISMATCH             
           JMP INPUT          
              
              
CURLY_BRACES:                                           
           DEC CX                  
           CMP CX,0                 
           JL MANY_RIGHT  
           POP DX       
           CMP DL, "{"           
           JNE MISMATCH            
           JMP INPUT 
       
LINE_BRACKET:                 
           DEC CX                
           CMP CX, 0                
           JL MANY_RIGHT
           POP DX           
           CMP DL, "["                
           JNE MISMATCH      
           JMP INPUT 
                         
END_INPUT: 
     CMP CX, 0                  
     JNE MANY_LEFT           
      
     MOV AH, 9               
     LEA DX, MSG_CORRECT              
     INT 21H                      
      
     LEA DX, MSG_CONTINUE             
     INT 21H
                            
     MOV AH,1                    
     INT 21H                    
      
     CMP AL, "Y"              
     JNE EXIT               
     JMP START                  
         
         
MISMATCH:  
     LEA DX, MSG_MISMATCH        
     MOV AH,9                     
     INT 21H
     JMP START                   
      
 
 
MANY_LEFT: 
     LEA DX, MSG_LEFT_BRACKET   
     MOV AH,9
     INT 21H
     JMP START               
            
            
MANY_RIGHT: 
     LEA DX, MSG_RIGHT_BRACKET     
     MOV AH,9
     INT 21H
     JMP START                   
       
EXIT:
 
     MOV AH,4CH               
     INT 21H 
MAIN ENDP
  END MAIN 