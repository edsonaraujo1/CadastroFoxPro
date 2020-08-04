CLEAR 
i_tecla = 0
 
DO WHILE i_tecla <> 27
   @ 10,10 say "Digite uma Tecla" 
   @ 10,30 get i_tecla
   read 
 
   IF i_tecla <> 27
      @ 12,10 say INKEY()
      @ 12,20 say INKEY(i_tecla)
      IF INKEY() = 27
         CLEAR
         EXIT do  
      ENDIF     
   ENDIF    
   
ENDDO 