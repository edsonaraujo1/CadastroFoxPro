
CLEAR 
COUNT FOR dat2 >= CTOD("02/10/2006") .and. dat2 <= CTOD("16/10/2006") TO to1
*COUNT FOR dat2 = "03/10/2006" TO to2
*COUNT FOR dat2 = "04/10/2006" TO to3
*COUNT FOR dat2 = "05/10/2006" TO to4
*COUNT FOR dat2 = "06/10/2006" TO to5
*COUNT FOR dat2 = "07/10/2006" TO to6
*COUNT FOR dat2 = "08/10/2006" TO to7
*COUNT FOR dat2 = "09/10/2006" TO to8
*COUNT FOR dat2 = "10/10/2006" TO to9


total1 = to1 && +to2+to3+to4+to5+to6+to7+to8+to9

? total1