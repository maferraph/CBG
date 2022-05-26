Local nPeso1,nPeso2,nK,GetList:={}

nPeso1 := nPeso2 := nK := 0

Use Cbg Index ICbg

Cls
@ 1,1 Say "Digite a constante para alterar pesos unit rios do acabado e forjado : " get nK Picture "@E 9.999999"
Read

dbGoTo(1)
While Recno() < 1268
      nPeso1 := CBG->PESO_UNIT
      nPeso2 := nPeso1 * nK
      CBG->PESO_UNIT := nPeso2
      dbSkip()
End

?? "Opera‡Æo Completada !!! "

dbCloseAll()
Return

