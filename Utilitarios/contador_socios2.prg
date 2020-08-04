*********************************************
* Contagem de socios em dia com o sindicato *
* Para simples consulta                     *
*********************************************
SET DELETED ON
USE socios   IN 1 SHARED 
USE ETQ_NOSS IN 2 

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
contador6 = 0
contador7 = 0

vMes = 07
vAno = 2007

@ 02,03 say "Digite o Mes "
@ 02,18 get vMes

@ 03,03 say "Digite o Ano "
@ 03,18 get vAno
READ 

DO WHILE .not. EOF()
   IF categoria = "R" 
      IF Cad_si = " "
         contador1 = contador1 + 1
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
      ENDIF    
   ENDIF
   
   IF categoria = "C" 
      IF Cad_si = " "
         contador6 = contador6 + 1
      ENDIF    
   ENDIF

   IF categoria = "C" 
      IF Cad_si = " "
         IF ano >= Vano
            contador7 = contador7 + 1
         ENDIF    
      ENDIF    
   ENDIF

   
   IF categoria = "C"
      IF ano >= vAno
         IF mes >= vmes
            IF Cad_si = " "
               contador4 = contador4 + 1
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
   @ 10,30 say contador1
   @ 11,02 say "Desistentes"
   @ 11,30 say contador2
   @ 12,02 say "Diretores"
   @ 12,30 say contador3

   @ 13,02 say "Contribuintes em dia "
   @ 13,30 say contador4
   @ 14,02 say "Aposntados contribuintes"
   @ 14,30 say contador5

   @ 15,02 say "Socios novos"
   @ 15,30 say contador7
   
   IF EOF()
      EXIT do 
   ENDIF
   SELECT 1
   SKIP
   LOOP 
ENDDO
@ 16,02 say "Total R+Dir+C+A"
@ 16,30 say contador1 + contador3 + contador4 + contador5

@ 18,02 say "Contribuintes Total cadastrados"
@ 18,30 say contador6