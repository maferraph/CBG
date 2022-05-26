/***********************************
X_PESO.PRG
PROGRAMA DO CBG
FEITO POR MAURÖCIO FERNANDES RAPHAEL
***********************************/
# include "Inkey.ch"

Local cResp,cK,nPeso,nNPeso,nRec,cAca,cFor,cLam,GetList:={}

cResp := cAca := cFor := cLam :=  space(1)
cK := nPeso := nNPeso := nRec := 0

Use Cbg Index ICbg

Cls
DispBox(0,0,2,79,2)
@ 1,24 Say "Conesteel Conexoes de A‡o Ltda."
DispBox(22,0,24,79,2)
@ 23,19 Say "Insira a constante para alterar os Pesos" 
DispBox(4,7,20,72,1)
@ 5,16 Say "Porcentagem para aumentar ou diminiur os Pesos" color("B+/N")
@ 6,08 Say Replicate("Í",64)
Begin Sequence
      @ 7,09 Say "Vocˆ tem certeza que deseja alterar os pesos <S/N> ?";
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
            @ 16,09 Say "Registro n§ : " + Transform(RecNo(),"9,999")
            @ 17,09 Say "Peso atual  : " + Transform(CBG->PESO_UNIT,"@E 9,999.99")
            @ 18,09 Say "Figura      : " + CBG->FIGURA
            @ 19,09 Say "Bitola      : " + CBG->BITOLA
            nPeso  := CBG->PESO_UNIT
            nNPeso := INT( nPeso * cK )
            DispBox(17,42,19,70,2)
            @ 18,43 Say "Novo Peso   : " + Transform(nNPeso,"@E 9,999.99")
            CBG->PESO_UNIT := nNPeso
            dbSkip(1)
         EndDo
      EndIf

      If cFor = "S"
         dbGoTo(1097)
         Do While RecNo() >= 1097 .and. RecNo() < 1194
            nRec := RecNo()
            @ 16,09 Say "Registro n§ : " + Transform(RecNo(),"9,999")
            @ 17,09 Say "Peso atual  : " + Transform(CBG->PESO_UNIT,"@E 9,999.99")
            @ 18,09 Say "Figura      : " + CBG->FIGURA
            @ 19,09 Say "Bitola      : " + CBG->BITOLA
            nPeso  := CBG->PESO_UNIT
            nNPeso := INT( nPeso * cK )
            DispBox(17,42,19,70,2)
            @ 18,43 Say "Novo Peso   : " + Transform(nNPeso,"@E 9,999.99")
            CBG->PESO_UNIT := nNPeso
            dbSkip(1)
         EndDo
      EndIf

      If cLam = "S"
         dbGoTo(1194)
         Do While RecNo() >= 1194 .and. RecNo() < 1300
            nRec := RecNo()
            @ 16,09 Say "Registro n§ : " + Transform(RecNo(),"9,999")
            @ 17,09 Say "Peso atual  : " + Transform(CBG->PESO_UNIT,"@E 9,999.99")
            @ 18,09 Say "Figura      : " + CBG->FIGURA
            @ 19,09 Say "Bitola      : " + CBG->BITOLA
            nPeso  := CBG->PESO_UNIT
            nNPeso := nPeso * cK 
            DispBox(17,42,19,70,2)
            @ 18,43 Say "Nova Peso   : " + Transform(nNPeso,"@E 9,999.99")
            CBG->PESO_UNIT := nNPeso
            dbSkip(1)
         EndDo
      EndIf

      @ 23,22 Say Replicate ("ÿ",50)
      @ 23,18 Say "Pesos alterados !!! Pressione qualquer tecla..." color ("R+*/N")
      Inkey(00)
      Break
End Sequence

Cls
dbCloseAll()
Clear Typeahead
Return


