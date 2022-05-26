/*********************************************
Programa criado por Maur¡cio Fernandes Raphael
Criado em 12/02/06

C lculo do Balan‡o Geral - CBG
*********************************************/

Local nMenu := 0

Set Century On
Set Date To British
Set Device to Screen
SetColor("GR+/N,R+/N")
Set Message To 23 Center
Set Wrap On
/****
Use Cbg
Index On Cbg->Numero To ICbg
dbCloseAll()
*****/
Use Cbg Index ICbg

While .T.
      Cls
      DispBox(0,0,2,79,2)
      @ 1,24 Say "Conesteel Conexoes de A‡o Ltda."
      DispBox(22,0,24,79,2)
      @ 23,3 Say "Mensagem :" 
      @ 07,22 Say "   Escolha uma Op‡Æo do Menu"
      @ 09,22 Prompt "       Imprimir o Balan‡o      " message "Imprime e calcula o Balan‡o Geral agora"
      @ 10,22 Prompt "      Inserir Quantidades      " message "Inseri as quantidades das pe‡as do balan‡o"
      @ 11,22 Prompt "    Inserir Pre‡os Unit rios   " message "Inseri os pre‡os unit rios das pe‡as do balan‡o"
      @ 12,22 Prompt "   Diminuir X % da quantidade  " message "Diminuir X % de cada quantidade de cada pe‡a"
      @ 13,22 Prompt " Diminuir X % do pre‡o unit rio" message "Diminuir X % de cada pre‡o de cada pe‡a"
      @ 14,22 Prompt "   Diminuir X % do peso total  " message "Diminuir X % de cada peso total de cada pe‡a"
      @ 15,22 Prompt "              Sair             " message "Sair do programa"
      Menu To nMenu
      If nMenu = 1
         Tone(350,4)
         Balanco()
      ElseIf nMenu = 2
         Tone(450,4)
         Quant()
      ElseIf nMenu = 3
         Tone(550,4)
      ElseIf nMenu = 4
         Tone(650,4)
         X_Quant()
      ElseIf nMenu = 5
         Tone(750,4)
         X_Preco()
      ElseIf nMenu = 6
         Tone(850,4)
         X_Peso()
      Else
         Exit
      EndIf
End 

SetColor("W/N")
Cls
Tone(550,1)
Tone(600,1)
Tone(700,1)
dbCloseAll()
Clear Typeahead
Return




