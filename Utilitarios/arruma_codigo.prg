GO TOP

cod_1 = 0

DO WHILE .not. EOF()
   cod_1 = cod_1 + 1
   @ 20,10 say cod
   replace cod WITH cod_1
   SKIP
   LOOP
   IF EOF()
      EXIT do 
   ENDIF
ENDDO
