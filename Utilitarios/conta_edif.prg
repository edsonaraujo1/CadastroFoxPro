conta_edif = 0

USE adms  IN 1 SHARED 
USE edif IN 2 SHARED 

SELECT 1
SET ORDER TO CODADM   && COD
GO TOP 

DO WHILE .t.
   SELECT 1
   STORE cod TO aa_adm
   SELECT 2
   IF aa_adm = adm
      conta_edif = conta_edif + 1
   ENDIF 
   SKIP
   LOOP
   IF EOF()
      EXIT do 
   ENDIF       
ENDDO
? conta_edif