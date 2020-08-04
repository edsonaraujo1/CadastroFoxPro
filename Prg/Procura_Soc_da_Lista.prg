*************************************************
* Procura Socios da Lista no cadastro de Socios *
*************************************************
SET DELETED ON 

USE socios     IN 1 SHARED
USE lunificada IN 2 SHARED 
SET STEP ON 

CLEAR
contador = 0

SELECT 2 && lunificada.dbf
SET ORDER TO NOME   && ABDIAS_ALV

SELECT 1 && Socios.dbf
SET ORDER TO CADNOME   && NOMEASSOC
GO TOP


DO WHILE .NOT. EOF()
   STORE Nomeassoc TO aa_nome
   STORE ALLTRIM(rua)+" "+ALLTRIM(endresid)+","+ALLTRIM(numero) TO aa_end
   STORE cepres    TO aa_cep
   STORE bairrores TO aa_bairro
   STORE cod       TO aa_cod
   STORE nu        TO aa_nu
   @ 07,10 say aa_nome
   @ 08,10 say aa_end
   
   SELECT 2
   SET ORDER TO NOME   && ABDIAS_ALV
   SEEK aa_nome
   IF .not. EOF()
      @ 10,10 say abdias_alv
      @ 11,10 say r__itacolo
      replace cep    WITH aa_cep
      replace bairro WITH aa_bairro 
      replace cod    WITH aa_cod
      replace nu     WITH aa_nu
      *WAIT 
      *DELETE 
      contador = contador + 1
      @ 14,10 say contador
      *WAIT 
   ENDIF
   SELECT 1
   SKIP
   LOOP     

ENDDO