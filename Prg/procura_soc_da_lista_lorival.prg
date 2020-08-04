**************************************************
* Procura Socios da Lista no cadastro do Lorival *
**************************************************
SET DELETED ON 

USE socios     IN 1 SHARED
USE lorival    IN 2 SHARED 
SET STEP ON 

CLEAR
contador = 0

SELECT 2 && Lorival.dbf
SET ORDER TO COD2   && STR(MATRICULA,6)+NU1
*SET ORDER TO NOME   && NOMEASSOC

SELECT 1 && Socios.dbf
SET ORDER TO CADSOC   && STR(COD,6)+NU
*SET ORDER TO CADNOME   && NOMEASSOC
GO TOP


DO WHILE .NOT. EOF()
   CLEAR 
   STORE Nomeassoc TO aa_nome
   STORE ALLTRIM(rua)+" "+ALLTRIM(endresid)+" ,"+ALLTRIM(numero) TO aa_end
   STORE cepres    TO aa_cep
   STORE bairrores TO aa_bairro
   STORE cod       TO aa_cod
   STORE nu        TO aa_nu
   @ 07,10 say STR(aa_cod)+nu
   @ 08,10 say aa_nome
   @ 09,10 say aa_end
   @ 10,10 say aa_cep
   
   SELECT 2
   SET ORDER TO cod2
   SEEK STR(aa_cod,6)+aa_nu
   IF .not. EOF()
      STORE nomeassoc TO aa_nome
      @ 13,10 say STR(MATRICULA,6)+NU1
      @ 14,10 say aa_nome
      @ 15,10 say endresid
      @ 16,10 say cepres
      replace endresid  WITH aa_end
      replace cepres    WITH aa_cep
      *WAIT 
      *DELETE 
      contador = contador + 1
      @ 18,10 say contador
      *WAIT windows 
      CLEAR 
   ENDIF
   SELECT 1
   SKIP
   LOOP     
   CLEAR 
ENDDO