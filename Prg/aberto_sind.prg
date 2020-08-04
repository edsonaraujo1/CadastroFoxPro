************************************************
* Atualiza cadastro de Sindical em Aberto *
************************************************
USE Sindical IN 1 SHARED
USE ABERTO IN 2 SHARED 
*SET STEP ON 
CLEAR

SELECT 2 && aberto.dbf
SET ORDER TO ABRE   && STR(COD,6)+VENCTO

SELECT 1 && Sindical.dbf
SET ORDER TO CADSIND   && SINDCOD 
GO TOP

DO WHILE .NOT. EOF()
   STORE SINDCOD TO aa_cod
   STORE vencto  TO aa_venc
   @ 07,10 say aa_cod
   @ 08,10 say aa_venc
   SELECT 2
   SET ORDER TO ABRE   && STR(COD,6)+VENCTO
   SEEK STR(aa_cod,6)+aa_venc
   IF .not. EOF()
      @ 10,10 say Confcod
      @ 11,10 say vencto
      DELETE 
      *WAIT 
   ENDIF
   SELECT 1
   SKIP
   LOOP     

ENDDO