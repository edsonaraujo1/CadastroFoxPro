USE aberto        IN 1 SHARED 
USE edif          IN 2 SHARED
USE lista_aberto  IN 3 SHARED

SET ORDER TO COD   && COD

GO TOP 

DO WHILE .not. EOF()
   STORE cod    TO aa_cod
   STORE vencto TO aa_venc
   @ 10,10 say aa_cod
   @ 11,10 say aa_venc
      
   SELECT 2
   SET ORDER TO CODEDIF   && COD
   SEEK aa_cod
   IF .not. EOF()
      IF aa_venc = "05/06/2006"
	      STORE Cond     TO aa_cond
	      STORE nome     TO aa_nome
	      STORE rua      TO aa_rua
	      STORE endereco TO aa_endereco
	      STORE numero   TO aa_numero
	      STORE bairro   TO aa_bairro
	      STORE cep      TO aa_cep
	      STORE adm      TO aa_adm
	      STORE cgc	     TO aa_cgc
          
	      SELECT 3
	      APPEND BLANK 
	      replace cod       WITH aa_cod
	      replace cond      WITH aa_cond
	      replace nome      WITH aa_nome
	      replace rua       WITH aa_rua
	      replace endereco  WITH aa_endereco
	      replace numero    WITH aa_numero
	      replace bairro    WITH aa_bairro
	      replace cep       WITH aa_cep
	      replace adm       WITH aa_adm
	      replace cgc       WITH aa_cgc
	      replace retorno   WITH aa_venc
	      
      ENDIF 
   ENDIF    
   SELECT 1
   SKIP 
   LOOP
ENDDO