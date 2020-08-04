************************************************
* Apaga Duplicados no cadastro de Edificios *
************************************************
USE Edif IN 1 SHARED
USE conf IN 2 SHARED 
CLEAR

SELECT 1 && Edif
SET ORDER TO NOMEEDIF   && NOME

GO TOP 
SET STEP ON 
DO WHILE .NOT. EOF()
   STORE cod        TO aa_cod
   STORE Alltrim(cond)+ALLTRIM(nome) 						TO aa_nome
   STORE ALLTRIM(rua)+ALLTRIM(endereco)+","+ALLTRIM(numero) TO aa_endereco
   STORE cep     											TO aa_cep
   STORE cgc  												TO aa_cgc
   
   @ 09,10 say "Codigo "+STR(cod)
   @ 10,10 Say "Cond. Encontrado "+aa_nome
   @ 11,10 say "Endereco "+aa_endereco
   @ 12,10 say "Cep "+aa_cep
   @ 13,10 say "CNPJ "+aa_cgc
   
   DO WHILE ALLTRIM(cond)+ALLTRIM(nome) = aa_nome 

       @ 15,10 say "Codigo "+STR(cod)
	   @ 16,10 Say "Cond. Encontrado "+alltrim(cond)+" "+Alltrim(nome)
	   @ 17,10 say "Endereco "+ALLTRIM(rua)+" "+ALLTRIM(endereco)+","+ALLTRIM(numero)
	   @ 18,10 say "Cep "+cep
	   @ 19,10 say "CNPJ "+cgc
	   STORE cod TO conf_cod
	   SELECT 2
	   SET ORDER TO CADCONF   && CONFCOD
	   SEEK conf_cod
	   IF .not. EOF()
	      @ 22,10 say "Encontrei contribuição"
	   ENDIF
	   SELECT 1
       WAIT 
	   SKIP
	   LOOP
    ENDDO
    SKIP
    LOOP 
ENDDO