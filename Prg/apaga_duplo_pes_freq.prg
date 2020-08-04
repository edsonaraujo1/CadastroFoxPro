************************************************
* Apaga Duplicados no cadastro de pes_soc *
************************************************
*USE pes_freq IN 1 SHARED
*SET STEP ON 
CLEAR

*SELECT 1 && pes_freq
*SET ORDER TO CADSOC   && STR(COD,6)+NU

GO TOP 
SET STEP ON 
DO WHILE .NOT. EOF()
   STORE cod TO aa_cod
   STORE nu  TO aa_nu
   DO WHILE (cod = aa_cod .and. nu = aa_nu)
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