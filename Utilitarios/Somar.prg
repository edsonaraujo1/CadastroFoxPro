clear 
d_ini = CTOD('07/10/1997') 
d_fim = CTOD('05/11/2007') 
nDias = (d_fim - d_ini) 
nMeses = INT( nDias / 30) 
nDias = nDias && - (nMeses*30) 
? nMeses 
? STR(nDias)