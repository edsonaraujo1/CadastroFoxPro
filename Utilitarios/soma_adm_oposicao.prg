USE oposicao2   IN 1 SHARED 
USE pes_adms_op IN 2 EXCLUSIVE  
USE adms        IN 3 SHARED 
USE edif        IN 4 SHARED 

SELECT 2
ZAP

*SET STEP ON 
SET DELETED ON
CLEAR 

conta1 = 0

SELECT 1
INDEX ON adms TO as
GO top

DO WHILE .not. EOF()
   STORE adms TO aa_adm
   SELECT 3
   SET ORDER TO CODADM   && COD
   SEEK aa_adm
   
   IF .not. EOF()
      STORE nomeadm TO aa_nome
      STORE fone    TO aa_fone
      STORE Nu_pred TO aa_pred
   ELSE    
      STORE " " TO aa_nome
      STORE " " TO aa_fone
      STORE 0   TO aa_pred
   ENDIF    
   SELECT 1
   DO WHILE aa_adm = adms
      IF (dat2 >= CTOD("01/10/2007")) 
	      conta1 = conta1 + 1
	      @ 10,10 say adms
	      @ 11,10 say conta1
	      @ 12,10 say " "
	  ENDIF    
      SKIP 
      LOOP 
   ENDDO 
   SELECT 2
   APPEND BLANK 
   replace adms WITH aa_adm
   replace nome WITH aa_nome
   replace fone WITH aa_fone
   replace edif WITH aa_pred
   replace qtd  WITH conta1
   
   @ 14,10 say "Gravei !!!"
*   WAIT 
   SELECT 1   
   conta1 = 0
   IF EOF()
      EXIT do 
   ENDIF    
   SKIP
   LOOP 
ENDDO