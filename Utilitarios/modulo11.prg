&& Dados fornecidos
*SET STEP ON 
CLEAR ALL 
CLEAR MEMORY ALL 
Set Century    On
CO_SIND   = 0
NOME1     = "COND. EDIF. RAQUEL"
CGC		  = "62.571.245/0001-26"
END1      = "RUA 7 DE ABRIL, 34"
CEP1      = "01044-000"
CIDADE1   = "SAO PAULO"
UF1       = "SP"
COD       = 34
ADM       = 0
txt_Data  = "05/11/2007"


&& Dados para Codigo de Barras
        
vBANCO 		= "001" 				&& 01 a 03 codigo banco 001      
vMOEDA 		= "9"					&& 04 a 04 Moeda 9

&& Fator Vencimento

d_ini = CTOD("07/10/1997") 
d_fim = CTOD(txt_Data) 
nDias = (d_fim - d_ini) 
nMeses = INT( nDias / 30) 
fat_venc = STR(nDias)  && = nDias && - (nMeses*30) 

vFAT_VENC  	= ALLTRIM(fat_venc)		&& 06 a 09 Fator vencimento (anexo 8)
vVALOR      = "0000000000"			&& 10 a 19 Valor
vCONV       = "284723"

STORE COD TO TC2
IF TC2 >    0 .and. TC2 < 10
   STORE "0000"+STR(TC2,1)   TO nTCOD
ENDIF
IF TC2 >    9 .and. TC2 < 100
   STORE "000"+STR(TC2,2)    TO nTCOD
ENDIF
IF TC2 >   99 .and. TC2 < 1000
   STORE "00"+STR(TC2,3)     TO nTCOD
ENDIF
IF TC2 >  999 .and. TC2 < 10000
   STORE "0"+STR(TC2,4)      TO nTCOD
ENDIF
IF TC2 > 9999 .and. TC2 < 100000
   STORE ""+STR(TC2,5)       TO nTCOD
ENDIF

vCOMPL      = nTCOD
vNOSSO      = vCONV+ALLTRIM(nTCOD)		&& Nosso Numero
vAGEN       = "1202"					&& Agencia 1202
vCONTA      = "17727"					&& Conta
vCART       = "18"

vCOD_BARRA  = vBANCO+vMOEDA+vFAT_VENC+vVALOR+vCONV+vCOMPL+vAGEN+"000"+vCONTA+vCART

vDIG_BARRA  = DIG_GER_1(vBANCO+vMOEDA+vFAT_VENC+vVALOR+vCONV+vCOMPL+vAGEN+"000"+vCONTA+vCART)

vDIG_W      = vCOD_BARRA

vDIG_20     = SUBSTR(vDIG_W,20,5)
vDIG       	= DIG_Ger_1(vBANCO+vMOEDA+VDIG_20)					&& 05 a 05 DV codigo de barras (anexo 9)
CAMPO1      = vBANCO+vMOEDA+"2."+SUBSTR(vDIG_20,1,4)+ALLTRIM(STR(vDIG))

vDIG_21     = SUBSTR(vDIG_W,24,10)
vDIG2       = DIG_VER_2(vDIG_21)
CAMPO2      = SUBSTR(vDIG_W,24,5)+"."+SUBSTR(vDIG_W,29,5)+ALLTRIM(STR(vDIG2))

vDIG_22     = SUBSTR(vDIG_W,35,9)
vDIG3       = DIG_VER_2(vDIG_22)
CAMPO3      = SUBSTR(vDIG_W,35,04)+"."+SUBSTR(vDIG_W,39,6)+ALLTRIM(STR(vDIG3))


CLEAR

? Vdig_22

? " "
? CAMPO1+"  "+CAMPO2+"  "+CAMPO3
? " "

? vDIG_W
? vDIG_20
? " "
? " "
? vFAT_VENC

*****************************************************
*   Funcao Digito verificador Nosso Numero          *
*                                                   *
*   Modulo 11 - Banco do Brasil                     *
*****************************************************

FUNCTION DIG_Nosso_1(NUMERO_xx)

conta1 = 0
dig    = 0
soma   =    "78923456789"
STORE VAL(SUBSTR(NUMERO_xx,11,1))*9 TO a_res1
STORE VAL(SUBSTR(NUMERO_xx,10,1))*8 TO a_res2
STORE VAL(SUBSTR(NUMERO_xx,09,1))*7 TO a_res3
STORE VAL(SUBSTR(NUMERO_xx,08,1))*6 TO a_res4
STORE VAL(SUBSTR(NUMERO_xx,07,1))*5 TO a_res5
STORE VAL(SUBSTR(NUMERO_xx,06,1))*4 TO a_res6
STORE VAL(SUBSTR(NUMERO_xx,05,1))*3 TO a_res7
STORE VAL(SUBSTR(NUMERO_xx,04,1))*2 TO a_res8
STORE VAL(SUBSTR(NUMERO_xx,03,1))*9 TO a_res9
STORE VAL(SUBSTR(NUMERO_xx,02,1))*8 TO a_res10
STORE VAL(SUBSTR(NUMERO_xx,01,1))*7 TO a_res11
STORE a_res1+a_res2+a_res3+a_res4+a_res5+a_res6+a_res7+a_res8+a_res9+a_res10+a_res11 TO a_tor
STORE MOD(a_tor,11) TO dig

IF MOD(a_tor,11) = 10
   STORE "X"           TO dig
ELSE
   STORE MOD(a_tor,11) TO dig
ENDIF 

RETURN(DIG)

ENDFUNC


*****************************************************
*   Funcao Digito verificador Codigo de Barras      *
*                                                   *
*   Modulo 11 - Banco do Brasil                     *
*****************************************************

FUNCTION DIG_GER_1(NUMERO_xx)

conta1 = 0
dig    = 0
soma = "98765432"
le_so = LEN(soma)
le_co1 = LEN(NUMERO_xx)

FOR i = 1 TO LEN(NUMERO_xx)
	STORE SUBSTR(NUMERO_xx,le_co1,1)        TO A1
	le_co1 = le_co1 - 1
	STORE SUBSTR(soma,le_so,1)         TO B1 
	le_so = le_so - 1
	IF le_so = 0
	   le_so = LEN(soma)
	ENDIF    
	STORE INT(VAL(A1)) * INT(VAL(B1))  TO fim
	IF fim < 10
	   conta1 = conta1 + fim
	ELSE
	   *STORE ALLTRIM(STR(fim)) TO fim_st
	   *FOR a = 0 TO 2
	   *     STORE SUBSTR(fim_st,a,1) TO fim
	   *     STORE INT(VAL(fim))      TO fim
	        conta1 = conta1 + fim
	   *ENDFOR  
	ENDIF       
ENDFOR     
IF MOD(conta1,11) = 0 .or. MOD(conta1,11) = 10 .or. MOD(conta1,11) = 1
   dig = 1
ELSE
   STORE 11 - MOD(conta1,11) TO dig
ENDIF 

 RETURN(DIG)

ENDFUNC

*****************************************************
*   Funcao Codigo de Barras Caixa Economica Federal *
*                                                   *
*   Modulo 10 - 2 por 1                             *
*****************************************************

FUNCTION DIG_VER_2(Numero_yy)

conta1  = 0
soma    = 0
faz     = 1
soma    = 0
FOR i = LEN(ALLTRIM(Numero_yy)) TO 0 STEP -1
    IF i > -1 
	   IF MOD(i,2)=1
		  valor=VAL(SUBSTR(Numero_yy,i,1))
	   ELSE   
		  valor=VAL(SUBSTR(Numero_yy,i,1))*2
	   ENDIF
	   IF valor > 9
	      FOR J = LEN(ALLTRIM(STR(VALOR))) TO 0 STEP -2
	          IF faz = 1
	             desm = SUBSTR(ALLTRIM(STR(valor)),1,1)
	             faz = 0
	          ELSE
	             desm = SUBSTR(ALLTRIM(STR(valor)),2,2)
	          ENDIF   
	          soma = soma + INT(VAL(desm))
	      ENDFOR 
	      faz = 1
	   ELSE
	      soma = soma + valor
	   ENDIF      
	ENDIF    
ENDFOR 

mRESTO=10-MOD(SOMA,10)  

IF mRESTO=10
   RESTO=0
ELSE
   RESTO=mRESTO
ENDIF

RETURN(RESTO)

ENDFUNC 



FUNCTION DIG_Nosso_2(NUMERO_xx)

conta1 = 0
dig    = 0
soma   =    "923456789"
STORE VAL(SUBSTR(NUMERO_xx,11,1))*9 TO a_res1
STORE VAL(SUBSTR(NUMERO_xx,10,1))*8 TO a_res2
STORE VAL(SUBSTR(NUMERO_xx,09,1))*7 TO a_res3
STORE VAL(SUBSTR(NUMERO_xx,08,1))*6 TO a_res4
STORE VAL(SUBSTR(NUMERO_xx,07,1))*5 TO a_res5
STORE VAL(SUBSTR(NUMERO_xx,06,1))*4 TO a_res6
STORE VAL(SUBSTR(NUMERO_xx,05,1))*3 TO a_res7
STORE VAL(SUBSTR(NUMERO_xx,04,1))*2 TO a_res8
STORE VAL(SUBSTR(NUMERO_xx,03,1))*9 TO a_res9
STORE a_res1+a_res2+a_res3+a_res4+a_res5+a_res6+a_res7+a_res8+a_res9 TO a_tor
STORE MOD(a_tor,11) TO dig

IF MOD(a_tor,11) = 10
   STORE "X"           TO dig
ELSE
   STORE MOD(a_tor,11) TO dig
ENDIF 

RETURN(DIG)

ENDFUNC
