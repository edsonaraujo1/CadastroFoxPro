CLEAR 
USE caixa   IN 1 SHARED
USE CADDESC IN 2 SHARED
USE receita IN 3 SHARED 
USE receita_cx IN 4 SHARED 

SET STEP ON 
SELECT 1 
SET ORDER TO CAI_IN3   && OPERADORA+STR(NUMERO,10)+STR(TIPO_MOV,16)+DATA

SELECT 3
GO bottom

STORE data      TO txt_data
STORE operadora TO txt_operadora
STORE semana    TO semana_x0
STORE semana1   TO semana_x1
STORE semana2   TO semana_x2
STORE semana3   TO semana_x3
STORE semana4   TO semana_x4
STORE semana5   TO semana_x5
STORE semana6   TO semana_x6
STORE semana7   TO semana_x7

FOR i = 1 TO 6
    IF i = 1
       semana_xfim = semana_x1
       faz_delta()
       i = 2
    ENDIF
    IF i = 2
       semana_xfim = semana_x2
       faz_delta()
       i = 3
    ENDIF
    IF i = 3
       semana_xfim = semana_x3
       faz_delta()
       i = 4
    ENDIF
    IF i = 4
       semana_xfim = semana_x4
       faz_delta()
       i = 5
    ENDIF
    IF i = 5
       semana_xfim = semana_x5
       faz_delta()
       i = 6
    ENDIF
    IF i = 6
       semana_xfim = semana_x6
       faz_delta()
       i = 7
    ENDIF
    IF i = 7
       semana_xfim = semana_x7
    ENDIF
    
NEXT           

************************************************************
*                                                          *    
*  F O R M U L A  C A L C U L O  R E C E I T A  C A I X A  *
*                                                          *
************************************************************
 
FUNCTION faz_delta()

Store substr(txt_data,4,4)                 to Ano_se_1
Store substr(txt_data,1,2)                 to Mes_se_1
Store semana_xfim                          to Sem_ana_1
Store Sem_ana_1+"/"+Mes_se_1+"/"+Ano_se_1  to se_dia
Store ctod(se_dia)                         to i_data

i_numero    = 1
i_operadora = txt_operadora
soma_x = 0
i9 = 1

SELECT 2
SET ORDER TO CADDESC   && CODIGO 
GO TOP

DO WHILE .not. EOF()
   STORE codigo    TO cod_desc
   STORE descricao TO dec_desc
   SELECT 1
   SET ORDER TO CAI_IN3
   GO TOP 
   STORE i_operadora+STR(i_numero,10)+STR(cod_desc,16)+DTOC(i_data) TO aa_CAI
   SEEK aa_CAI
   IF .not. EOF()
      DO WHILE aa_CAI = Operadora+STR(numero,10)+STR(tipo_mov,16)+Data
         soma_x = soma_x + vlr_tot
         IF .not. eof()
            SKIP 
         ELSE 
            EXIT   
         ENDIF   
      ENDDO
   ENDIF  
   ? soma_x
   ? dec_desc

   IF i9 = 7
	  *** ALTERA ****
	  SELECT 4
	  replace semana2   WITH INT(VAL(Sem_ana_1))
	  replace b         WITH soma_x
   ENDIF   
   IF i9 = 6
	  *** ALTERA ****
	  SELECT 4
	  replace semana6   WITH INT(VAL(Sem_ana_1))
	  replace f         WITH soma_x
      i9 = 7
   ENDIF   
   IF i9 = 5
	  *** ALTERA ****
	  SELECT 4
	  replace semana5   WITH INT(VAL(Sem_ana_1))
	  replace e         WITH soma_x
      i9 = 6
   ENDIF   
   IF i9 = 4
	  *** ALTERA ****
	  SELECT 4
	  replace semana4   WITH INT(VAL(Sem_ana_1))
	  replace d         WITH soma_x
      i9 = 5
   ENDIF   
   IF i9 = 3
	  *** ALTERA ****
	  SELECT 4
	  replace semana3   WITH INT(VAL(Sem_ana_1))
	  replace c         WITH soma_x
      i9 = 4
   ENDIF   
   IF i9 = 2
	  *** ALTERA ****
	  SELECT 4
	  replace semana2   WITH INT(VAL(Sem_ana_1))
	  replace b         WITH soma_x
      i9 = 3
   ENDIF   
   IF i9 = 1
	  *** PRIMEIRO DEVE INCLUIR NOVO ****
	  SELECT 4
	  APPEND BLANK   
	  replace data      WITH DTOC(i_data)
	  replace mes       WITH INT(VAL(Mes_se_1))
	  replace operadora WITH i_operadora
	  replace item      WITH STR(cod_desc)
	  replace descricao WITH dec_desc
	  replace semana1   WITH INT(VAL(Sem_ana_1))
	  replace a         WITH soma_x
	  i9 = 2
   ENDIF   
   
   ? " "
   soma_x = 0
   SELECT 2
   SKIP
   LOOP 
ENDDO
   
ENDFUNC