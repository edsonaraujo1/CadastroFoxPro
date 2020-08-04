************************************************
* Atualiza cadastro de Contribuicoes em Aberto *
************************************************
USE lista_marcos_zona_leste IN 1 SHARED
*SET STEP ON 
CLEAR

SELECT 1 && aberto.dbf
INDEX ON cod TO as

*SET ORDER TO CADSOC   && STR(COD,6)+NU 
GO TOP 
SET STEP ON 
DO WHILE .NOT. EOF()
   STORE cod TO aa_cod
   DO WHILE cod = aa_cod
      ? cod
      SKIP
      IF cod = aa_cod
         ? "deletei"
         DELETE
      ENDIF
      *SKIP
      LOOP
    ENDDO
    *SKIP
    *LOOP 
ENDDO