.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'ENTER THREE INITIALS: $'
    MSG1 DB 'FIRST NAME INITIAL : $' 
    MSG2 DB 'SECOND NAME INITIAL : $'
    MSG3 DB 'THIRD NAME INITIAL : $'
    CHAR DB ?,'$'
      
.CODE
  MAIN PROC
    MOV AX, @DATA       
    MOV DS,AX          

    MOV AH,9            ;print msg
    MOV DX,OFFSET MSG
    INT 21H             
           
    MOV AH,1            ;input
    INT 21H 
               
    SUB AL, 20H         ;to upper case
    MOV CHAR, AL        
                 
    MOV DX,10           ;next line
    MOV AH,2
    INT 21H
    MOV DX,13
    MOV AH,2
    INT 21H
    
    MOV AH,9            ;print msg2
    MOV DX,OFFSET MSG2
    INT 21H             
    
    MOV AH,2            ;output
    MOV DL,CHAR
    INT 21H              
                  
              
              
    MOV AH,4CH
    INT 21H               
  MAIN ENDP
END MAIN
    