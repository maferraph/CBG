Local cFigura,cBitola,nNume,nNumero,cPre_Unit

cFigura := cBitola := space(15)
cPre_Unit := space (7)
nNume := nNumero := 0

Set Device to Screen
SetColor("GR+/N,R+/N")

Use Cec
Index On Cec->Nume To ICec
dbCloseAll()
Use Cbg
Index On Cbg->Numero To ICbg
dbCloseAll()

nNume := 1

While nNume <= 1097
      Cls
      @ 1,1 Say "Aguarde por favor !!! - Registro: " + Transform(nNume,"@E 9999")
      Use Cec Index ICec
      dbGoTo(nNume)
      cFigura := Cec->Figura
      cBitola := Cec->Bitola
      nNumero := Cec->Nume
      cPre_Unit := Cec->Pre_Real
      dbSkip(1)
      dbCloseAll()
      Use Cbg Index ICbg
      dbGoTo(nNume)
      dbAppend()
      Cbg->Figura := cFigura
      Cbg->Bitola := cBitola
      Cbg->Numero := nNumero
      Cbg->Pre_Unit := cPre_Unit
      dbCloseAll()
      nNume++
End

Cls
dbCloseAll()
Clear Typeahead
Return




