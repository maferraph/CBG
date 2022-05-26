Local HH,KK,MM,PP,nLin

? "Coloque a impressora no modo 'CONDENSED' e pressione qualquer tecla..."
Inkey(00)
Cls
Set Device To Screen

@ 1,19 Say "S¡mbolos do c¢digo ASC do DOS"

HH := 1
KK := 65
MM := 130
PP := 193
nLin := 3

While nLin < 66
      @ nLin,2  Say "ASC " + Transform(HH,"999") + " : " + Chr(HH)
      @ nLin,18 Say "ASC " + Transform(KK,"999") + " : " + Chr(KK)
      @ nLin,38 Say "ASC " + Transform(MM,"999") + " : " + Chr(MM)
      @ nLin++,58 Say "ASC " + Transform(PP,"999") + " : " + Chr(PP)
      HH++
      KK++
      MM++
      PP++
End

//Eject
Set Device To Screen
Return

