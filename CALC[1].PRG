Local nOp,nPAca,nTAca,nPFor,nTFor,nPLam,nTLam,GetList := {}

nOp := nPAca := nTAca := nPFor := nTFor := nPLam := nTLam := 0

Use Cbg Index ICbg

Cls

@ 1,1 Say "C lculo do Balan‡o Geral - CBG - Programa CALC"
@ 3,1 Say "Escolha uma das op‡äes abaixo : "
@ 4,1 Say " 1 - Valores do Acabado "
@ 5,1 Say " 2 - Valores do Forjado "
@ 6,1 Say " 3 - Valores do Laminado"
@ 8,1 Say " Sua op‡Æo ‚ : " get nOp Picture "9" 
Read

If nOp = 1
   dbGoTo(1)
   While Recno() < 1097
         nPAca += Cbg->Quantidade * Cbg->Pre_Unit
         nTAca += Cbg->Quantidade * Cbg->Peso_Unit
         dbSkip(1)
   End
   @ 10,1 Say "Valor Total do Acabado : R$ " + Transform(nPAca,"@E 9,999,999.99")
   @ 11,1 Say "Peso Total do Acabado : " + Transform(nTAca,"@E 9,999,999.99") + " kgs."
   ?
ElseIf nOp = 2
   dbGoTo(1097)
   While Recno() < 1267
         nPFor += Cbg->Quantidade * Cbg->Pre_Unit
         nTFor += Cbg->Quantidade * Cbg->Peso_Unit
         dbSkip(1)
   End
   @ 10,1 Say "Valor Total do Forjado : R$ " + Transform(nPFor,"@E 9,999,999.99")
   @ 11,1 Say "Peso Total do Forjado : " + Transform(nTFor,"@E 9,999,999.99") + " kgs."
   ?
ElseIf nOp = 3
   dbGoTo(1268)
   While Recno() < 1334
         nPLam += Cbg->Quantidade * Cbg->Pre_Unit
         nTLam += Cbg->Quantidade * Cbg->Peso_Unit
         dbSkip(1)
   End
   @ 10,1 Say "Valor Total do Laminado : R$ " + Transform(nPLam,"@E 9,999,999.99")
   @ 11,1 Say "Peso Total do Laminado : " + Transform(nTLam,"@E 9,999,999.99") + " kgs."
   ?
EndIf

dbCloseAll()
Return

