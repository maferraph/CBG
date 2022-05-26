/***********************************
Programa QUANT.PRG
Programa do CBG
Feito por Maur¡cio Fernandes Raphael
***********************************/
# include "Inkey.ch"

Local nQuant,nRec,GetList:={}

nQuant := nRec := 0

Use Cbg Index ICbg

Cls
DispBox(0,0,2,79,2)
@ 1,24 Say "Conesteel Conexoes de A‡o Ltda."
DispBox(22,0,24,79,2)
@ 23,24 Say "Insira as quantidades das pe‡as" 
dbGoTo(1)

