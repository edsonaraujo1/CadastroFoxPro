SET STEP ON 
CLEAR 
x_operadora = "NILVA          "
x_data = "11/2005"
x_item = 1

*SET ORDER TO COD2   && SUBSTR(DATA,4,7)+OPERADORA+STR(ITEM) 
SET ORDER TO COD   && DATA+OPERADORA 
*GO TOP 
STORE x_data+x_operadora+STR(x_item) TO aa_cons 
SEEK x_data+x_operadora
IF EOF()
   ? "nao achei"
ELSE
   ? "achei"
   ? data
   ? mes
   ? operadora
   ? item
   ? a
ENDIF
      