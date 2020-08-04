LOCAL lnT, lnU, lcBarras, lcEspacos, lcRetorno, lnTamanho

SET STEP ON 
&& Dados fornecidos
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

? fat_venc

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

vDIG       	= DIG_GER_1(vNOSSO+vCONTA+vAGEN)					&& 05 a 05 DV codigo de barras (anexo 9)


LOCAL ARRAY laBarras(10)
laBarras[1]  = "00110"
laBarras[2]  = "10001"
laBarras[3]  = "01001"
laBarras[4]  = "11000"
laBarras[5]  = "00101"
laBarras[6]  = "10100"
laBarras[7]  = "01100"
laBarras[8]  = "00011"
laBarras[9]  = "10010"
laBarras[10] = "01010"
lcRetorno = "FfFf"        && Sequencia inicial


		&& Codigo Contribuinte identificador sindicato
		
		DO CASE 
			CASE COD<10
				RET="000000"+STR(COD,1)
			CASE COD>9 .and. COD<100
				RET="00000"+STR(COD,2)
			CASE COD>99 .and. COD<1000
				RET="0000"+STR(COD,3)
			CASE COD>999 .and. COD<10000
				RET="000"+STR(COD,4)
			CASE COD>9999 .and. COD<100000
				RET="00"+STR(COD,5)
		ENDCASE			

		idEDIF  =     "00000"+RET
		
		&& CGC
        STORE SUBSTR(cgc,1,2)  TO pri
        STORE SUBSTR(cgc,4,3)  TO seg
        STORE SUBSTR(cgc,8,3)  TO ter
        STORE SUBSTR(cgc,12,4) TO qua	
        STORE SUBSTR(cgc,17,2) TO qui	
        
        STORE (vNOSSO+STR(vDIG))  TO idEDIF
         
        && Dados para Codigo de Barras
        
        vBANCO 		= "001" 				&& 01 a 03 codigo banco 001      
        vMOEDA 		= "9"					&& 04 a 04 Moeda 9
        vDIG       	= ""					&& 05 a 05 DV codigo de barras (anexo 9)
        vFAT_VENC  	= ALLTRIM(fat_venc)		&& 06 a 09 Fator vencimento (anexo 8)
        vVALOR      = "0000000000"			&& 10 a 19 Valor
        
        vSICO       = ""				&& 20 a 30
        vCOD_ENTI   = "284723"
        
        vCOD_CNAE	= "" && "3"
        vTIPO_ENT	= "" && "1"
        vSITCS		= ""
        vCOD_CONTRI	= idEDIF && "000000000000"  && CNPJ COM 14 DIGITOS
        vCNAE  		= "" && "12"
                
        STORE ALLTRIM(vCOD_CNAE)+ALLTRIM(vCNAE) TO cod_ativid
		
        && Codigo de Barras
        STORE vBANCO+vMOEDA+vDIG+vFAT_VENC+vVALOR+vSICO+vCOD_ENTI+;
              vCOD_CNAE+vTIPO_ENT+vSITCS+vCOD_CONTRI+vCNAE TO CÓDIGO

		STORE SUBSTR(txt_Data,7,10) TO ano_zz
		STORE SUBSTR(txt_Data,4,2)  TO mes_zz 
		STORE ALLTRIM(ano_zz)+ALLTRIM(mes_zz)     TO MESANO

		CONTAR   = 0
        DIG_NOVO = ""
		Valor1   = " "
		Valor2   = " "
		Valor3   = " "
		Valor4   = " "
		Valor5   = " "
		Valor6   = " "

		STORE " " TO w_VAL_1  && Valor
		STORE " " TO w_VAL_2  && Descontos
		STORE " " TO w_VAL_3  && Multa/Juros
		STORE " " TO w_VAL_4  && Correcao
		STORE " " TO w_VAL_5
		STORE " " TO w_VAL_6  && Valor Final
    
	numérico 	= ""
	linha_dig   = ""
	tcNumero 	= ""
	lcRetorno = "FfFf"        && Sequencia inicial
	
	CONTAR = CONTAR+1
	
    && Linha Ditavel
        

	STORE "0"+vBANCO+vMOEDA+vSICO+SUBSTR(vCOD_ENTI,1,3)                            TO Campo1_c
	STORE vBANCO+vMOEDA+vSICO+SUBSTR(vCOD_ENTI,1,3)                                TO Campo1
	dig1=DIG_GER_1(Campo1_c)
	STORE SUBSTR(vCOD_ENTI,4,6)+vCOD_CNAE+vTIPO_ENT+vSITCS+SUBSTR(vCOD_CONTRI,1,4) TO Campo2
	dig2=DIG_GER_1(Campo2)
	STORE SUBSTR(vCOD_CONTRI,5,8)+vCNAE                                            TO Campo3
	dig3=DIG_VER_1(Campo3)
	STORE vFAT_VENC+vVALOR      												   TO Campo5

    mui_tt =      (SUBSTR(Campo1,1,4)+Campo5+SUBSTR(Campo1,5,5)+Campo2+Campo3)
    dig4=DIG_GER_1(SUBSTR(Campo1,1,4)+Campo5+SUBSTR(Campo1,5,5)+Campo2+Campo3)

    lin_comum = ""
    lin_comum   = (ALLTRIM(Campo1)+STR(dig1,1)+ALLTRIM(Campo2)+STR(dig2,1)+ALLTRIM(Campo3)+ALLTRIM(STR(dig3))+ALLTRIM(STR(dig4,1))+ALLTRIM(Campo5))
    
	STORE lin_comum TO lin_1
    
    *linha_dig = lin_1
	STORE SUBSTR(lin_1,1,5)+"."+SUBSTR(lin_1,6,5)+"  "+SUBSTR(lin_1,11,5)+"."+;
	      SUBSTR(lin_1,16,6)+"  "+SUBSTR(lin_1,22,5)+"."+SUBSTR(lin_1,27,6)+"  "+;
	      SUBSTR(lin_1,33,1)+"  "+SUBSTR(lin_1,34,14) TO linha_dig

	DIG_NOVO=(vBANCO+vMOEDA+STR(dig4,1)+vFAT_VENC+vVALOR+vSICO+vCOD_ENTI+;
              vCOD_CNAE+vTIPO_ENT+vSITCS+vCOD_CONTRI+vCNAE)

	tcNumero=DIG_NOVO

     numérico = linha_dig
    
	lnTamanho = LEN(ALLTRIM(tcNumero))
		
	*-- Se quantidade de caracteres nao for par coloca 0 na frente
	*IF lnTamanho % 2 <> 0
	*	tcNumero = "0" + tcNumero
	*ENDIF

	lnTamanho = LEN(ALLTRIM(tcNumero))	

	FOR lnT = 1 TO lnTamanho STEP 2

	    *-- Pega os 0 e 1
	    lcBarras  = laBarras[VAL(SUBSTR(tcNumero, lnT, 1)) + 1]
	    lcEspacos = laBarras[VAL(SUBSTR(tcNumero, lnT + 1, 1)) + 1]

	    *-- Combima as barras e os espacos
	    FOR lnU = 1 TO 5
	        lcRetorno = lcRetorno + IIF(SUBSTR(lcBarras, lnU, 1) == "0", "F", "G")
	        lcRetorno = lcRetorno + IIF(SUBSTR(lcEspacos, lnU, 1) == "0", "f", "g")
	    NEXT InU

	NEXT lnT

	*-- Acrescenta sequencia de finalizacao
	
	lcRetorno = ALLTRIM(lcRetorno) + "GfFf"
			
              && Seu Numero
              STORE COD TO TC2
              IF TC2 >    0 .and. TC2 < 10
                 STORE "00000"+STR(TC2,1)   TO nTCOD
              ENDIF
	          IF TC2 >    9 .and. TC2 < 100
	             STORE "0000"+STR(TC2,2)    TO nTCOD
	          ENDIF
	          IF TC2 >   99 .and. TC2 < 1000
	             STORE "000"+STR(TC2,3)     TO nTCOD
	          ENDIF
	          IF TC2 >  999 .and. TC2 < 10000
	             STORE "00"+STR(TC2,4)      TO nTCOD
	          ENDIF
	          IF TC2 > 9999 .and. TC2 < 100000
	             STORE "0"+STR(TC2,5)       TO nTCOD
	          ENDIF

	          STORE ADM TO TC3
	          IF TC3 = 0
	             STORE "0000"               TO nc_ADM
	          ENDIF
	          IF TC3 >    0 .and. TC3 < 10
	             STORE "000"+STR(TC3,1)     TO nc_ADM
	          ENDIF
	          IF TC3 >    9 .and. TC3 < 100
	             STORE "00"+STR(TC3,2)      TO nc_ADM
	          ENDIF
	          IF TC3 >   99 .and. TC3 < 1000
	             STORE "0"+STR(TC3,3)       TO nc_ADM
	          ENDIF
	          IF TC3 >  999 .and. TC3 < 10000
	             STORE ""+STR(TC3,4)        TO nc_ADM
	          ENDIF
			
			  *NOME1		=	ALLTRIM(COND)+" "+ALLTRIM(NOME)
			  AD_COD  	=   "[ "+nTCOD+"-"+nc_ADM+" ]"
			  *END1		=	ALLTRIM(RUA)+" "+ALLTRIM(ENDERECO)+", "+ALLTRIM(NUMERO)
			  *BAIRRO1	=	BAIRRO
			  *CIDADE1	=	CIDADE
			  *UF1		=	UF
			  *CEP1		=	CEP
			  COD1		=	IDEDIF
			  CNPJ      =   CGC
			  VECTO		=	txt_Data && "30/04/2004"
			  *EXERC		=	Thisform.txtAno.Value  && "2004"
			  CODABER   = COD

			  * Imprime a Guia
              co_sind = co_sind + 1 
*              REPORT FORM G:\Desenv\Sindificios_Adms\Reports\bancobrasil.frx NOEJECT NOCONSOLE TO PRINTER RANGE 1,1
              REPORT FORM G:\Desenv\Sindificios_Adms\Reports\bancobrasil.frx PREVIEW 
			  numérico  =""
			  lcRetorno =""
			  

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

IF MOD(a_tor,11) = 0 .or. MOD(a_tor,11) = 10 .or. MOD(a_tor,11) = 11 
   dig = 1
ELSE
   STORE 11 - MOD(a_tor,11) TO dig
ENDIF 

RETURN(DIG)

ENDFUNC