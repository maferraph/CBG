Local nLin,nCol,nPag,nQuantidade,nTot,nPeso,nValor,nTonelada,nR,nK
Local GetList:={}

nPag := 1
nLin := nCol := nQuantidade := nTot := nPeso := nValor := nTonelada := nR := nK := 0

Use Cbg
Index On Cbg->Numero To ICbg
dbCloseAll()

Cls
@ 01,10 Say "Pressione qualquer tecla quando a impressora estiver pronta !!!"
@ 03,12 Say "Coloque a impressora no modo 'Condensed' antes de imprimir. " color ("GR+*/N")
Inkey(00)

Set Device To Print

Use Cbg Index ICbg
dbGoTo(1)
nQuantidade := Cbg->Quantidade

While RecNo() < 1097
      nTot := Cbg->Quantidade * Cbg->Pre_Unit
      Cbg->Pre_Total := nTot
      nPeso := Cbg->Quantidade * Cbg->Peso_Unit
      Cbg->Peso_Total := nPeso
      nTot := nPeso := 0
      dbSkip(1)
      nQuantidade := Cbg->Quantidade
End

dbGoTo(1)
While RecNo() < 1097
      nLin := 1
      nCol := 0
      @  nLin++,0  Say "�" + Replicate("�",126) + "�"
      @  nLin  ,0  Say "�                                                 Conesteel Conex�es de A�o Ltda."
      @  nLin++,127 Say "�"
      @  nLin++,0  Say "�" + Replicate("�",126) + "�"
      @  nLin++,0  Say "�" + Replicate("�",126) + "�"
      @  nLin  ,0  Say "�"
      @  nLin  ,10 Say Date()
      @  nLin  ,41 Say "Rascunho do Acabado do Balan�o Anual de Conex�es"
      @  nLin  ,110 Say "P�g.: " + Transform (nPag,"@E 999")
      @  nLin++,127 Say "�"
      @  nLin++,0  Say "�" + Replicate("�",126) + "�"
      @  nLin++,0  Say "������������������������������������������������������������������������������������������������������������������������������Ŀ"
      @  nLin++,0  Say "� Quantidade: �      Pe�a :      �     Bitola :    �  Pre�o Unit�rio :  �  Pre�o Total :  �  Peso Unit�rio :  �  Peso Total :  �"
      @  nLin++,0  Say "��������������������������������������������������������������������������������������������������������������������������������"

      While nLin < 61 .and. RecNo() < 1097
            If nQuantidade <> 0 
               @   nLin,05   Say Cbg->Quantidade
               @   nLin,20   Say Cbg->Figura
               @   nLin,37   Say Cbg->Bitola
               @   nLin,57   Say Cbg->Pre_Unit Picture "@E 9,999.99"
               @   nLin,74   Say Cbg->Pre_Total Picture "@E 999,999.99"
               nValor += Cbg->Pre_Total
               @   nLin,97   Say Cbg->Peso_Unit Picture "@E 999.99"
               @ nLin++,113  Say Cbg->Peso_Total Picture "@E 999,999.99"
               nTonelada += Cbg->Peso_Total
            EndIf
            dbSkip(1)
            nQuantidade := Cbg->Quantidade
      End
      @ nLin++,0  Say "�" + Replicate("�",126) + "�"
      @ nLin  ,0  Say "�"
      @ nLin  ,47 Say "Valor total desta folha � : R$" + Transform(nValor,"@E 9,999,999.99")
      @ nLin++,127 Say "�"
      @ nLin++,0 Say "�" + Replicate("�",126) + "�"
      @ nLin  ,0 Say "�"
      @ nLin  ,47 Say "Peso  total desta folha � : " + Transform(nTonelada,"@E 999,999.99") + " Kgs."
      @ nLin++,127 Say "�"
      @ nLin++,0 Say "�" + Replicate("�",126) + "�"
      nPag++
      nR += nValor
      nK += nTonelada
      nValor := nTonelada := 0
End

nLin++
@ nLin++,0  Say "�" + Replicate("�",126) + "�"
@ nLin  ,0  Say "�"
@ nLin  ,47 Say "Valor Total de Acabado do Balan�o : R$" + Transform(nR,"@E 9,999,999.99")
@ nLin++,127 Say "�"
@ nLin++,0 Say "�" + Replicate("�",126) + "�"
@ nLin  ,0 Say "�"
@ nLin  ,47 Say "Peso Total de Abacado do Balan�o : " + Transform(nK,"@E 999,999.99") + " Kgs."
@ nLin++,127 Say "�"
@ nLin++,0 Say "�" + Replicate("�",126) + "�"


Eject
Clear Typeahead
dbCloseAll()
Set Device To Screen
Cls
Return


