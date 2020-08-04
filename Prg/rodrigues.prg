USE edif     IN 1 SHARED 
USE adms     IN 2 SHARED 
USE sindical IN 11 SHARED 

USE pes_sind IN 91 SHARED 


SET STEP ON 
codadm  = 118
codedif = 0
contap = 0
pagina = 1
SELECT 91
DELETE ALL 

SELECT 2
SET ORDER TO CODADM   && COD
GO TOP 
SEEK codadm
IF .not. EOF()
   STORE cod     TO cod_22
   STORE nome1   TO nome_22
   STORE nomeadm TO nome_23
   STORE cgc     TO cgc_22
ENDIF 
SELECT 1
GO TOP 
SELECT 2 && adm

SELECT 91
APPEND BLANK
replace cod     WITH cod_22
replace nome1   WITH nome_22
replace nomeadm WITH nome_23
replace cgc     WITH cgc_22

SET DEVICE TO PRINTER
*??? chr(18)+chr(15)+chr(18)
&&                              10        20        30        40        50        60        70        80        90
&&                    01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
@ PROW() + 01,00 SAY "==============================================================================================="
@ PROW() + 01,00 SAY " SINDIFICIOS                                                                                                                                               pagina "      
@ PROW() + 00,56 SAY DATE()
@ PROW() + 00,114 SAY ALLTRIM(STR(pagina))
@ PROW() + 01,00 SAY "==============================================================================================="
@ PROW() + 01,00 SAY "         Segue abaixo a relacao das Contribuicoes SINDICAL"
@ PROW() + 01,00 SAY "         da EMPRESA...:" 
@ PROW() + 00,27 SAY cod_22
@ PROW() + 00,40 SAY nome_23
@ PROW() + 01,01 SAY "         CNPJ.............: "+cgc_22 
@ PROW() + 01,00 SAY "==============================================================================================="
*SET DEVICE TO SCREEN 
SELECT 1 && edif
GO TOP 
SET ORDER TO ADMEDIF   && ADM
SEEK cod_22

DO WHILE adm = cod_22
*   SET ORDER TO ADMEDIF   && ADM
*   SEEK cod_22
   IF .not. EOF()
      STORE cod     TO edif_cod
      STORE cond    TO edif_cond
      STORE nome    TO edif_nome
      STORE adm     TO edif_adm
      STORE cgc     TO edif_cgc
      
      SELECT 91 && pes_sind
	  APPEND BLANK
	  replace cod     WITH edif_cod
	  replace sindcod WITH edif_cod
	  replace cond    WITH edif_cond
	  replace nome    WITH edif_nome
	  replace cgc     WITH edif_cgc
	  replace adm     WITH edif_adm
*      SET DEVICE TO PRINTER 
&&                                    10        20        30        40        50        60        70        80   
&&                          012345678901234567890123456789012345678901234567890123456789012345678901234567890
      @ PROW() + 01,00 SAY "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
      @ PROW() + 01,00 SAY "  Codigo      Nome Edificio                                                 Cnpj                                                           Adm"
      @ PROW() + 01,00 SAY edif_cod
      @ PROW() + 00,12 SAY ALLTRIM(cond)+" "+ALLTRIM(nome)
      @ PROW() + 00,57 SAY edif_cgc
      @ PROW() + 00,95 SAY edif_adm
	  @ PROW() + 01,00 SAY "  Codigo       Vencimento                 Valor Pago"
      @ PROW() + 01,00 SAY "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
*      SET DEVICE TO SCREEN 
      contap = contap + 1 
	  SELECT 11 && sindical
	  SET ORDER TO CADSIND   && SINDCOD
	  GO TOP 
	  SEEK edif_cod
	  DO while .t. EOF()
	     STORE sindcod TO aa_sindcod
	     STORE vencto  TO aa_vencto
	     STORE total   TO aa_total
	     
	     IF sindcod = edif_cod
		    SELECT 91 && pes_sind
			APPEND BLANK
			replace sindcod  WITH aa_sindcod
			replace total    WITH aa_total
			replace vencto   WITH aa_vencto
IF contap < 44

		    *SET DEVICE TO PRINTER 
		    &&                              10        20        30        40        50        60        70        80   
		    &&                    012345678901234567890123456789012345678901234567890123456789012345678901234567890
		    @ PROW() + 01,00 SAY aa_sindcod
		    @ PROW() + 00,14 SAY aa_vencto
		    @ PROW() + 00,30 SAY aa_total
		    contap = contap + 1
            *SET DEVICE TO SCREEN 
ELSE
      @ PROW() + 01,00 SAY "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

   contap = 0
   pagina = pagina + 1
   EJECT
	@ PROW() + 01,00 SAY "==============================================================================================="
	@ PROW() + 01,00 SAY " SINDIFICIOS                                                                                                                                               pagina "      
	@ PROW() + 00,56 SAY DATE()
	@ PROW() + 00,114 SAY ALLTRIM(STR(pagina))
	@ PROW() + 01,00 SAY "==============================================================================================="
	@ PROW() + 01,00 SAY "         Segue abaixo a relacao das Contribuicoes SINDICAL"
	@ PROW() + 01,00 SAY "         da EMPRESA...:" 
	@ PROW() + 00,27 SAY cod_22
	@ PROW() + 00,40 SAY nome_23
	@ PROW() + 01,01 SAY "         CNPJ.............: "+cgc_22 
	@ PROW() + 01,00 SAY "==============================================================================================="

ENDIF             
            
		 ELSE
		    EXIT do 
		    SELECT 11
		    SKIP
		    LOOP 	
		 ENDIF 	
		 SELECT 11
	     SKIP 
	     loop   
      ENDDO 

   ELSE
      SKIP 
      LOOP    
   ENDIF    
   SELECT 1
   SKIP 
   LOOP 
ENDDO 
SET PRINTER TO 
