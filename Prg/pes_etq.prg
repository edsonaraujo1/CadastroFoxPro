CLEAR 
PUBLIC cTitulo, Pagto, cad 
cTitulo = "Etiquetas de Socios"
SET PROCEDURE TO G:\DESENV\SINDIFICIOS5000\PRG\FUNCTIONS2.PRG
SET DATE BRITISH
SET CENTURY ON 
SET DELETED ON 
SET DEFAULT TO f:\arquivos
OPEN DATABASE Bancodados SHARED 
USE socios    IN 3  shared     
USE etq_001   IN 4 SHARED 

SET STEP ON 

Sele 3
Set Order to cadsoc

conta1 = 0
txtCod1 = 3
txtCod2 = 99999

*SEEK STR(txtCod1,6)
GO TOP 

DO WHILE .not. EOF()        

Store cod        TO aa_cod
Store nu         TO aa_nu
Store categoria  TO aa_cat
Store nomeassoc  TO aa_nome
Store endresid   TO aa_end
Store numero     TO aa_nurero
Store rua        TO aa_rua
Store bairrores  TO aa_bair
Store cidaderes  TO aa_cidade
Store estadores  TO aa_estado
Store cepres     TO aa_cep
Store mes        TO aa_mes
Store ano        TO aa_ano

   @ 10,11 say Nomeassoc
   @ 11,11 say mes       
   @ 12,11 say ano
   @ 13,11 say STR(cod,6)+ALLTRIM(nu)

pagto = .T.
IF CATEGORIA = "R"
         conta1 = conta1 + 1
         @ 16,11 say conta1
         
         SELECT 4         
         Append Blank

         replace cod        WITH  aa_cod
         replace nu         WITH aa_nu
         replace categoria  WITH aa_cat
         replace nomeassoc  WITH aa_nome
         replace endresid   WITH aa_end
         replace numero     WITH aa_nurero
         replace rua        WITH aa_rua
         replace bairrores  WITH aa_bair
         replace cidaderes  WITH aa_cidade
         replace estadores  WITH aa_estado
         replace cepres     WITH aa_cep
         replace mes        WITH aa_mes
         replace ano        WITH aa_ano

         SELECT 3
	pagto = .T.
ENDIF
IF CATEGORIA = "F"
	*=Messagebox("Socio consta como FALECIDO !", cTitulo)
	pagto = .F.
ENDIF
IF CATEGORIA = "D"
	*=Messagebox("Socio consta como DESLIGADO !", cTitulo)
	pagto = .F.
ENDIF
IF CATEGORIA = "L"
	*=Messagebox("Socio consta como ELIMINADO do Quadro Social !", cTitulo)
	pagto = .F.
ENDIF
IF CATEGORIA = "V"
	*=Messagebox("Socio deve comparecer a DIRETORIA !", cTitulo)
	pagto = .F.
ENDIF

IF CATEGORIA = "O"
	*=Messagebox("Socio com Carta de Oposicao !", cTitulo)
	pagto = .F.
ENDIF

IF CATEGORIA = "C" .OR. CATEGORIA = "A" .OR. CATEGORIA = "I" .OR. CATEGORIA = "R"

    store substr(datinsc,7,10) TO ANOSOC
    STORE VAL(ANOSOC)          TO ANOSOC2
    
    *Store (month(datinsc) - month(date())) to qtd_pag
    
    STORE YEAR(Date())  TO Hoje
    
    STORE Hoje - ANOSOC2 TO v_FIM
    
    If v_FIM >= 20
       *=Messagebox("Socio consta como REMIDO !", cTitulo)
    Else
 
    STORE DATE()-90     TO PGSOC 

	DO CASE
		CASE MES = 01
			STORE "30/01" TO MDT
		CASE MES = 02
			STORE "30/02" TO MDT
  		CASE MES = 03
			STORE "30/03" TO MDT
		CASE MES = 04
 			STORE "30/04" TO MDT
		CASE MES = 05
			STORE "30/05" TO MDT
		CASE MES = 06
			STORE "30/06" TO MDT
		CASE MES = 07
			STORE "30/07" TO MDT
		CASE MES = 08
 			STORE "30/08" TO MDT
		CASE MES = 09
			STORE "30/09" TO MDT
		CASE MES = 10
			STORE "30/10" TO MDT
		CASE MES = 11
			STORE "30/11" TO MDT
		CASE MES = 12
			STORE "30/12" TO MDT
		OTHERWISE
			STORE "00/00" TO MDT
		ENDCASE
		DO CASE
			CASE ANO = 1999
				STORE "/1999" TO ADT
			CASE ANO = 2000
				STORE "/2000" TO ADT
			CASE ANO = 2001
				STORE "/2001" TO ADT
			CASE ANO = 2002
				STORE "/2002" TO ADT
			CASE ANO = 2003
				STORE "/2003" TO ADT
			CASE ANO = 2004
				STORE "/2004" TO ADT
			CASE ANO = 2005
				STORE "/2005" TO ADT
			CASE ANO = 2006
				STORE "/2006" TO ADT
			CASE ANO = 2007
				STORE "/2007" TO ADT
			CASE ANO = 2008
				STORE "/2008" TO ADT
			CASE ANO = 2009
				STORE "/2009" TO ADT
			CASE ANO = 2010
				STORE "/2010" TO ADT
			OTHERWISE
				STORE "00" TO ADT 
			ENDCASE
			
   STORE MDT + ADT TO DATA1
   STORE CTOD(DATA1) TO CERTO
   IF PGSOC >= CERTO
      pagto = .F.
   ELSE
         conta1 = conta1 + 1
         @ 16,11 say conta1
         SELECT 4         
         Append Blank

         replace cod        WITH  aa_cod
         replace nu         WITH aa_nu
         replace categoria  WITH aa_cat
         replace nomeassoc  WITH aa_nome
         replace endresid   WITH aa_end
         replace numero     WITH aa_nurero
         replace rua        WITH aa_rua
         replace bairrores  WITH aa_bair
         replace cidaderes  WITH aa_cidade
         replace estadores  WITH aa_estado
         replace cepres     WITH aa_cep
         replace mes        WITH aa_mes
         replace ano        WITH aa_ano
         
         SELECT 3          
         SKIP 
         LOOP 
   ENDIF
Endif			
ENDIF

SKIP
LOOP 

ENDDO     