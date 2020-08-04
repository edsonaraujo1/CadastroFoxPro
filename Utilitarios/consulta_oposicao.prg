SET STEP ON 
SET DELETED ON
SET DATE BRITISH 
Set Century    On

CLEAR 


USE oposicao2    IN 1 SHARED 
USE socios       IN 2 SHARED 
USE pes_oposicao IN 3 SHARED 
USE adms         IN 4 SHARED 
USE edif         IN 5 SHARED 

SELECT 1 && oposicao2
SET ORDER TO RG_OP   && RGASSOC
GO top

DO WHILE .not. EOF() 
   STORE matricula TO aa_cod
   STORE nu1       TO aa_nu
   STORE Rgassoc   TO aa_rg
   STORE dat2      TO aa_dat2
   STORE datinsc   TO aa_data
   
   IF rgassoc <> " "
      IF (dat2 >= CTOD("02/10/2006"))
      
		 @ 10,10 say STR(aa_cod,6)+ALLTRIM(aa_nu)
		 @ 11,10 say aa_dat2
		 @ 12,10 say aa_rg
      
		 SELECT 2 && Socios
		 SET ORDER TO CADRG   && RGASSOC
		 SEEK aa_rg
		   
		   IF .not. EOF()
		      STORE cod 		TO aa_cod
		      STORE nu  		TO aa_nu
		      STORE nomeassoc 	TO aa_nome
		      STORE endresid    TO aa_end
		      STORE cepres      TO aa_cep 
		      STORE categoria   TO aa_cat
		      STORE rgassoc     TO aa_rg
		      STORE mes 		TO aa_mes
		      STORE ano 		TO aa_ano
		      STORE codedif     TO aa_edif
		      STORE Datinsc     TO aa_data
		      
		      SELECT 5 && Edif
		      SET ORDER TO CODEDIF   && COD
		      SEEK aa_edif
		      IF .not. EOF()
		         STORE adm  TO aa_adm
		         STORE ativ TO aa_ativ
		      ELSE 
		         aa_adm = 0
		         ativ = " "
		      ENDIF
		      
		      SELECT 3 && pes_oposicao
		      APPEND BLANK 
		      replace cod       WITH aa_cod
		      replace nu        WITH aa_nu
		      replace nomeassoc WITH aa_nome
		      replace endresid  WITH aa_end
		      replace cepres    WITH aa_cep
		      replace rgassoc   WITH aa_rg
		      replace mes       WITH aa_mes
		      replace ano       WITH aa_ano
		      replace codedif   WITH aa_edif
		      replace adms      WITH aa_adm
		      replace mes       WITH aa_mes
		      replace ano       WITH aa_ano
		      replace dat2      WITH aa_dat2
		      replace datinsc   WITH CTOD(aa_data)
		      replace categoria WITH aa_cat
		   ELSE
		      SELECT 1 
		      SKIP
		      LOOP    
		   ENDIF 
	   ENDIF 	   
   ENDIF    
   SELECT 1 && oposicao2
   SKIP
   LOOP 
ENDDO

