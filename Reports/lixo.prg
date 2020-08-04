USE receita_cx
clear
replace total WITH a+b+c+d+e+f+g ALL 
SUM total TO tot_fim

GO top
DO WHILE .not. EOF()
   STORE 100*total/tot_fim TO por_cent
   replace por WITH por_cent
   ? total
   ? por
   SKIP
   LOOP 
ENDDO 