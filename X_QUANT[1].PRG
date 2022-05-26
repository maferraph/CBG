/***********************************
X_QUANT.PRG
PROGRAMA DO CBG
FEITO POR MAURÖCIO FERNANDES RAPHAEL
***********************************/
# include "Inkey.ch"

Local cResp,cK,nQuant,nNQuant,nRec,cAca,cFor,cLam,GetList:={}

cResp := cAca := cFor := cLam :=  space(1)
cK := nQuant := nNQuant := nRec := 0

Use Cbg Index ICbg

Cls
DispBox(0,0,2,79,2)
@ 1,24 Say "Conesteel Conexoes de A‡o Ltda."
DispBox(22,0,24,79,2)
@ 23,17 Say "Insira a constante para alterar as quantidades" 
DispBox(4,7,20,72,1)
@ 5,16 Say "Porcentagem para aumentar ou diminiur a Quantidade" color("B+/N")
@ 6,08 Say Replicate("Í",64)
Begin Sequence
      @ 7,09 Say "Vocˆ tem certeza que deseja alterar as quantidades <S/N> ?";
             Get cResp Picture "@! A" valid cResp $ "SN"
      Read
      If cResp = "N"
         Break
      ElseIf LastKey() = K_ESC
         Break
      EndIf

      @ 08,09 Say "Se vocˆ deseja aumentar por exemplo 10%, digite o valor 1.10,"
      @ 09,09 Say "caso for diminuir, 10%, digite o valor 0.90."
      @ 11,09 Say "Digite o valor da constante desejada : " Get cK;
              Picture "@E 99.99999999"
      Read

      @ 13,09 Say "Alterar Acabados  <S/N> ?" Get cAca Picture "@! A" valid cAca $ "SN"
      Read
      @ 14,09 Say "Alterar Forjados  <S/N> ?" Get cFor Picture "@! A" valid cFor $ "SN"
      Read
      @ 15,09 Say "Alterar Laminados <S/N> ?" Get cLam Picture "@! A" valid cLam $ "SN"
      Read
      
      If cAca = "S"
         dbGoTo(1)
         Do While RecNo() >= 1 .and. RecNo() < 1097
               nRec := RecNo()
               @ 16,09 Say "Registro n§      : " + Transform(RecNo(),"9,999")
               @ 17,09 Say "Quantidade atual : " + Transform(CBG->QUANTIDADE,"@E 9,999.99")
               @ 18,09 Say "Figura           : " + CBG->FIGURA
               @ 19,09 Say "Bitola           : " + CBG->BITOLA
               nQuant  := CBG->QUANTIDADE
               nNQuant := INT( nQuant * cK )
               DispBox(17,42,19,70,2)
               @ 18,43 Say "Nova Quantidade  : " + Transform(nNQuant,"@E 9,999.99")
               CBG->QUANTIDADE := nNQuant
               dbSkip(1)
         EndDo
      EndIf

      If cFor = "S"
         dbGoTo(1097)
         Do While RecNo() >= 1097 .and. RecNo() < 1268
            nRec := RecNo()
            @ 16,09 Say "Registro n§      : " + Transform(RecNo(),"9,999")
            @ 17,09 Say "Quantidade atual : " + Transform(CBG->QUANTIDADE,"@E 9,999.99")
            @ 18,09 Say "Figura           : " + CBG->FIGURA
            @ 19,09 Say "Bitola           : " + CBG->BITOLA
            nQuant  := CBG->QUANTIDADE
            nNQuant := INT( nQuant * cK )
            DispBox(17,42,19,70,2)
            @ 18,43 Say "Nova Quantidade  : " + Transform(nNQuant,"@E 9,999.99")
            CBG->QUANTIDADE := nNQuant
            dbSkip(1)
         EndDo
      EndIf

      If cLam = "S"
         dbGoTo(1268)
         Do While RecNo() >= 1268 .and. RecNo() < 1334
            nRec := RecNo()
            @ 16,09 Say "Registro n§      : " + Transform(RecNo(),"9,999")
            @ 17,09 Say "Quantidade atual : " + Transform(CBG->QUANTIDADE,"@E 9,999.99")
            @ 18,09 Say "Figura           : " + CBG->FIGURA
            @ 19,09 Say "Bitola           : " + CBG->BITOLA
            nQuant  := CBG->QUANTIDADE
            nNQuant := nQuant * cK 
            If nQuant = 0
               nNQuant := 0
            EndIf
            DispBox(17,42,19,70,2)
            @ 18,43 Say "Nova Quantidade  : " + Transform(nNQuant,"@E 9,999.99")
            CBG->QUANTIDADE := nNQuant
            dbSkip(1)
         EndDo
      EndIf

      @ 23,22 Say Replicate ("ÿ",50)
      @ 23,15 Say "Quantidades alteradas !!! Pressione qualquer tecla..." color ("R+*/N")
      Inkey(00)
      Break
End Sequence

Cls
dbCloseAll()
Clear Typeahead
Return


