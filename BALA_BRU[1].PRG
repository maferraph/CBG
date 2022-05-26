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
dbGoTo(1097)
nQuantidade := Cbg->Quantidade

While .not. EOF()
      nTot := Cbg->Quantidade * Cbg->Pre_Unit
      Cbg->Pre_Total := nTot
      nPeso := Cbg->Quantidade * Cbg->Peso_Unit
      Cbg->Peso_Total := nPeso
      nTot := nPeso := 0
      dbSkip()
      nQuantidade := Cbg->Quantidade
End

dbGoTo(1097)
While RecNo() <= 1333
      nLin := 1
      nCol := 0
      @  nLin++,0  Say "É" + Replicate("Í",126) + "»"
      @  nLin  ,0  Say "º                                                 Conesteel Conexåes de A‡o Ltda."
      @  nLin++,127 Say "º"
      @  nLin++,0  Say "È" + Replicate("Í",126) + "¼"
      @  nLin++,0  Say "É" + Replicate("Í",126) + "»"
      @  nLin  ,0  Say "º"
      @  nLin  ,10 Say Date()
      @  nLin  ,41 Say "Rascunho da Mat.Prima do Balan‡o Anual de Conexäes"
      @  nLin  ,110 Say "P g.: " + Transform (nPag,"@E 999")
      @  nLin++,127 Say "º"
      @  nLin++,0  Say "È" + Replicate("Í",126) + "¼"
      @  nLin++,0  Say "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
      @  nLin++,0  Say "³ Quantidade: ³      Pe‡a :      ³     Bitola :    ³  Pre‡o Unit rio :  ³  Pre‡o Total :  ³  Peso Unit rio :  ³  Peso Total :  ³"
      @  nLin++,0  Say "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"

      While nLin < 61 .and. RecNo() <= 1333
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
            dbSkip()
            nQuantidade := Cbg->Quantidade
      End
      @ nLin++,0  Say "Ú" + Replicate("Ä",126) + "¿"
      @ nLin  ,0  Say "³"
      @ nLin  ,47 Say "Valor total desta folha ‚ : R$" + Transform(nValor,"@E 9,999,999.99")
      @ nLin++,127 Say "³"
      @ nLin++,0 Say "Ã" + Replicate("Ä",126) + "´"
      @ nLin  ,0 Say "³"
      @ nLin  ,47 Say "Peso  total desta folha ‚ : " + Transform(nTonelada,"@E 999,999.99") + " Kgs."
      @ nLin++,127 Say "³"
      @ nLin++,0 Say "À" + Replicate("Ä",126) + "Ù"
      nPag++
      nR += nValor
      nK += nTonelada
      nValor := nTonelada := 0
End

nLin++
@ nLin++,0  Say "É" + Replicate("Í",126) + "»"
@ nLin  ,0  Say "º"
@ nLin  ,47 Say "Valor Total de Mat.Prima do Balan‡o : R$" + Transform(nR,"@E 9,999,999.99")
@ nLin++,127 Say "º"
@ nLin++,0 Say "Ì" + Replicate("Í",126) + "¹"
@ nLin  ,0 Say "º"
@ nLin  ,47 Say "Peso Total de Mat.Prima do Balan‡o : " + Transform(nK,"@E 999,999.99") + " Kgs."
@ nLin++,127 Say "º"
@ nLin++,0 Say "È" + Replicate("Í",126) + "¼"

Eject
Clear Typeahead
dbCloseAll()
Set Device To Screen
Cls
Return

