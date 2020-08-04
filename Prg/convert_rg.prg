*SET STEP ON 

GO TOP 
CLEAR 
SET DELETED ON 

Mcodigo = ""
mtotal  = ""

DO WHILE .not. EOF()
   FOR I = 1 TO LEN(ALLTRIM(rgassoc))
       IF SUBSTR(rgassoc,i,1)<>"." .and. SUBSTR(rgassoc,i,1)<>"-"
          mcodigo = mcodigo + SUBSTR(rgassoc,i,1)
          @ 10,10 say mcodigo
          @ 12,10 say rgassoc
       ENDIF
   ENDFOR
   replace rgassoc WITH ALLTRIM(mcodigo)
   Mcodigo = ""
   mtotal  = ""
   skip     
   LOOP 
ENDDO
