*********************************************
* Contagem de socios em dia com o sindicato *
* para gerar etiquetas !!!                  *
*********************************************

SET DELETED ON
USE socios   IN 1 SHARED 
*USE ETQ_NOSS IN 2 

SELECT 2
*ZAP

SELECT 1
SET ORDER TO CADSOC   && STR(COD,6)+NU 

GO TOP 
CLEAR

contador1 = 0
contador2 = 0
contador3 = 0
contador4 = 0
contador5 = 0

vMes = 06
vAno = 2006

DO WHILE .not. EOF()
   IF categoria = "R" 
      IF Cad_si = " "
         contador1 = contador1 + 1
         
         SELECT 1
         
         STORE cod        TO aa_cod
         STORE nu         TO aa_nu
		 STORE sede       TO aa_sede
		 STORE categoria  TO aa_categoria
		 STORE nomeassoc  TO aa_nomeassoc
		 STORE endresid   TO aa_endresid
		 STORE numero     TO aa_numero
		 STORE rua        TO aa_rua
		 STORE bairrores  TO aa_bairrores
		 STORE cidaderes  TO aa_cidaderes
		 STORE estadores  TO aa_estadores
		 STORE cepres     TO aa_cepres
		 STORE cargoassoc TO aa_cargoassoc
		 STORE datadimis  TO aa_dataimis
		 STORE mes        TO aa_mes
		 STORE ano        TO aa_ano
		 STORE cad_si     TO aa_cad_si

         SELECT 2
         Append Blank

         Replace cod        With aa_cod
         Replace nu         With aa_nu
		 Replace sede       With aa_sede
		 Replace categoria  With aa_categoria
		 Replace nomeassoc  With aa_nomeassoc
		 Replace endresid   With aa_endresid
		 Replace numero     WITH aa_numero
		 Replace rua        WITH aa_rua
		 Replace bairrores  With aa_bairrores
		 Replace cidaderes  With aa_cidaderes
		 Replace estadores  With aa_estadores
		 Replace cepres     With aa_cepres
		 Replace cargoassoc With aa_cargoassoc
		 Replace datadimis  With aa_dataimis
		 Replace mes        With aa_mes
		 Replace ano        With aa_ano
		 Replace cad_si     With aa_cad_si
         
         SELECT 1
         
      ENDIF    
   ENDIF
   IF categoria = "D" 
      IF Cad_si = " "
         contador2 = contador2 + 1
      ENDIF    
   ENDIF
   IF categoria = "P" 
      IF Cad_si = " "
         contador3 = contador3 + 1
         
         SELECT 1 
         
         STORE cod        TO aa_cod
         STORE nu         TO aa_nu
		 STORE sede       TO aa_sede
		 STORE categoria  TO aa_categoria
		 STORE nomeassoc  TO aa_nomeassoc
		 STORE endresid   TO aa_endresid
		 STORE numero     TO aa_numero
		 STORE rua        TO aa_rua
		 STORE bairrores  TO aa_bairrores
		 STORE cidaderes  TO aa_cidaderes
		 STORE estadores  TO aa_estadores
		 STORE cepres     TO aa_cepres
		 STORE cargoassoc TO aa_cargoassoc
		 STORE datadimis  TO aa_dataimis
		 STORE mes        TO aa_mes
		 STORE ano        TO aa_ano
		 STORE cad_si     TO aa_cad_si

         SELECT 2
         Append Blank

         Replace cod        With aa_cod
         Replace nu         With aa_nu
		 Replace sede       With aa_sede
		 Replace categoria  With aa_categoria
		 Replace nomeassoc  With aa_nomeassoc
		 Replace endresid   With aa_endresid
		 Replace numero     WITH aa_numero
		 Replace rua        WITH aa_rua
		 Replace bairrores  With aa_bairrores
		 Replace cidaderes  With aa_cidaderes
		 Replace estadores  With aa_estadores
		 Replace cepres     With aa_cepres
		 Replace cargoassoc With aa_cargoassoc
		 Replace datadimis  With aa_dataimis
		 Replace mes        With aa_mes
		 Replace ano        With aa_ano
		 Replace cad_si     With aa_cad_si
         
         SELECT 1
         
      ENDIF    
   ENDIF
   IF categoria = "C"
      IF ano >= vAno
         IF mes >= vmes
            IF Cad_si = " "
               contador4 = contador4 + 1
               
               SELECT 1
               
		         STORE cod        TO aa_cod
		         STORE nu         TO aa_nu
				 STORE sede       TO aa_sede
				 STORE categoria  TO aa_categoria
				 STORE nomeassoc  TO aa_nomeassoc
				 STORE endresid   TO aa_endresid
				 STORE numero     TO aa_numero
				 STORE rua        TO aa_rua
				 STORE bairrores  TO aa_bairrores
				 STORE cidaderes  TO aa_cidaderes
				 STORE estadores  TO aa_estadores
				 STORE cepres     TO aa_cepres
				 STORE cargoassoc TO aa_cargoassoc
				 STORE datadimis  TO aa_dataimis
				 STORE mes        TO aa_mes
				 STORE ano        TO aa_ano
				 STORE cad_si     TO aa_cad_si

		         SELECT 2
		         Append Blank

		         Replace cod        With aa_cod
		         Replace nu         With aa_nu
				 Replace sede       With aa_sede
				 Replace categoria  With aa_categoria
				 Replace nomeassoc  With aa_nomeassoc
				 Replace endresid   With aa_endresid
				 Replace numero     WITH aa_numero
				 Replace rua        WITH aa_rua
				 Replace bairrores  With aa_bairrores
				 Replace cidaderes  With aa_cidaderes
				 Replace estadores  With aa_estadores
				 Replace cepres     With aa_cepres
				 Replace cargoassoc With aa_cargoassoc
				 Replace datadimis  With aa_dataimis
				 Replace mes        With aa_mes
				 Replace ano        With aa_ano
				 Replace cad_si     With aa_cad_si
		         
		         SELECT 1

            ENDIF    
         ENDIF
      ELSE
         SKIP
         LOOP    
      ENDIF
   ENDIF
   IF categoria = "A"
      IF ano >= vAno
         IF mes <= vMes
            IF Cad_si = " "
               contador5 = contador5 + 1
                
                SELECT 1

		         STORE cod        TO aa_cod
		         STORE nu         TO aa_nu
				 STORE sede       TO aa_sede
				 STORE categoria  TO aa_categoria
				 STORE nomeassoc  TO aa_nomeassoc
				 STORE endresid   TO aa_endresid
				 STORE numero     TO aa_numero
				 STORE rua        TO aa_rua
				 STORE bairrores  TO aa_bairrores
				 STORE cidaderes  TO aa_cidaderes
				 STORE estadores  TO aa_estadores
				 STORE cepres     TO aa_cepres
				 STORE cargoassoc TO aa_cargoassoc
				 STORE datadimis  TO aa_dataimis
				 STORE mes        TO aa_mes
				 STORE ano        TO aa_ano
				 STORE cad_si     TO aa_cad_si

		         SELECT 2
		         Append Blank

		         Replace cod        With aa_cod
		         Replace nu         With aa_nu
				 Replace sede       With aa_sede
				 Replace categoria  With aa_categoria
				 Replace nomeassoc  With aa_nomeassoc
				 Replace endresid   With aa_endresid
				 Replace numero     WITH aa_numero
				 Replace rua        WITH aa_rua
				 Replace bairrores  With aa_bairrores
				 Replace cidaderes  With aa_cidaderes
				 Replace estadores  With aa_estadores
				 Replace cepres     With aa_cepres
				 Replace cargoassoc With aa_cargoassoc
				 Replace datadimis  With aa_dataimis
				 Replace mes        With aa_mes
				 Replace ano        With aa_ano
				 Replace cad_si     With aa_cad_si
		         
		         SELECT 1

            ENDIF    
         ENDIF
         SELECT 1
      ELSE
         SELECT 1
         SKIP
         LOOP    
      ENDIF
      SELECT 1
   ENDIF
   SELECT 1
   
   @ 10,02 say "Remidos"
   @ 10,19 say contador1
   @ 11,02 say "Desistentes"
   @ 11,19 say contador2
   @ 12,02 say "Diretores"
   @ 12,19 say contador3

   @ 13,02 say "Contribuintes"
   @ 13,19 say contador4
   @ 14,02 say "Aposntados"
   @ 14,19 say contador5
   IF EOF()
      EXIT do 
   ENDIF
   SELECT 1
   SKIP
   LOOP 
ENDDO
@ 16,02 say "Total"
@ 16,19 say contador1 + contador3 + contador4 + contador5


