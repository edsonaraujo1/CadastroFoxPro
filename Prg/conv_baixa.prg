CLEAR

USE arq     IN 1 SHARED 
USE conf    IN 2 SHARED 

SELECT 1
GO top

DO WHILE .not. EOF()
   STORE confcod   TO cc_confcod
   STORE data      TO cc_data
   STORE total     TO cc_total
   STORE pagto     TO cc_pagto
   STORE vencto    TO cc_vencto 
   STORE agencia   TO cc_agencia
   STORE dat_bai   TO cc_dat_bai
   STORE descricao TO cc_descricao
   @ 07,10 say cc_confcod
   @ 08,10 say cc_vencto
   @ 09,10 say cc_total
   SELECT 2
   APPEND BLANK 
   replace confcod   WITH cc_confcod
   replace data      WITH DTOC(cc_data)
   replace total     WITH cc_total
   replace pagto     WITH DTOC(cc_pagto)
   replace vencto    WITH DTOC(cc_vencto)
   replace agencia   WITH cc_agencia
   replace dat_bai   WITH DTOC(cc_dat_bai)
   replace descricao WITH cc_descricao
   SELECT 1
   SKIP    
ENDDO