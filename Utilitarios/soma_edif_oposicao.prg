USE oposicao2   IN 1 SHARED 
USE pes_Edif_op IN 2 SHARED 
USE edif        IN 3 SHARED 

SET STEP ON 
SET DELETED ON
CLEAR 

GO top
conta1 = 0

SELECT 1
SET INDEX TO as

DO WHILE .not. EOF()
   STORE codedif TO aa_adm
   SELECT 3
   SET ORDER TO CODEDIF   && COD
   SEEK aa_adm
   
   IF .not. EOF()
      STORE ALLTRIM(cond)+" "+ALLTRIM(nome) TO aa_nome
      STORE ALLTRIM(rua)+" "+ALLTRIM(endereco)+","+ALLTRIM(numero) TO aa_endereco
      STORE fone    TO aa_fone
   ELSE    
      STORE " " TO aa_nome
      STORE " " TO aa_fone
   ENDIF    
   SELECT 1
   DO WHILE aa_adm = codedif
      IF (dat2 >= CTOD("02/10/2006")) 
	      conta1 = conta1 + 1
	      @ 10,10 say codedif
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
   replace qtd  WITH conta1
   @ 14,10 say "Gravei !!!"
   WAIT 
   SELECT 1   
   conta1 = 0
   IF EOF()
      EXIT do 
   ENDIF    
   SKIP
   LOOP 
ENDDO