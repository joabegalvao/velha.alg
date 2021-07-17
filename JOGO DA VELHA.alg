algoritmo "semnome"

//============================LIMPA A MATRIZ PARA UM NOVO JOGO========================

 Procedimento LimpaMatriz()
      Inicio
         Para i de 1 ate 3 faca
            Para j de 1 ate 3 faca
               cont <- cont + 1
               numMatriz[i,j] <- numpcarac(cont)
            Fimpara
         Fimpara
   Fimprocedimento


//===================PROCEDIMENTO DOS NUMEROS NA MATRIZ=============================
   Procedimento preencherMatriz()
      Inicio
         Para i de 1 ate 3 faca
            Para j de 1 ate 3 faca
               cont <- cont + 1
               numMatriz[i,j] <- numpcarac(cont)
            Fimpara
         Fimpara
   Fimprocedimento
//================================LAYOUT============================================
   
   Procedimento layoutVelha()
      Inicio
         EscrevaL("   JOGO DA VELHA")
         EscrevaL()
         EscrevaL(" +-----+-----+-----+")
         Para i de 1 ate 3 faca
            Para j de 1 ate 3 faca
               Escreva(" |")
               Escreva(numMatriz[i,j]:4)
            Fimpara
               EscrevaL(" |")
               EscrevaL(" +-----+-----+-----+")
         Fimpara
         EscrevaL()
   Fimprocedimento
//=================================VELHA===========================================

   Procedimento jogar()
      Inicio
       x <- "X"
       vencedor <- falso
       vezes <- 0
       modulo <- 1
       resp <- "s"
       


       
          EscrevaL("Informe o nome do jogador X ")
          Leia(nomeX)
          EscrevaL("Informe o nome do jogador O ")
          Leia(nomeO)
       
   Enquanto (resp = "s") faca
   Limpatela
    cont <- 0
    vezes <- 0
    LimpaMatriz()
    layoutVelha()
    ExibirPontuacaoJogadores()
    nome <- nomeX

   
   Repita

          Escreva(" -> [",x,"] Vez de ", nome ,": ")
          Leia(num)
             Se (num >= 1) e (num <= 9) entao

             //======================================================================================
                Se (num >= 1) e (num <= 3) entao
                   L <- 1 //Direcionando a linha (O numero 1 é a linha 1)
                   Se (numMatriz[L,num] = "X") ou (numMatriz[L,num] = "O") entao
                      EscrevaL("Lugar já ocupado")
                      EscrevaL("*ENTER para continuar")
                      Leia(retornoErro)
                   Senao
                      numMatriz[L,num] <- x
                      trocaJogadores()
                   Fimse
                Senao
             //======================================================================================
                   Se (num >= 4) e (num <=6) entao
                      L <- 2
                      Se (numMatriz[L,num-3] = "X") ou (numMatriz[L,num-3] = "O") entao
                         EscrevaL("Lugar já ocupado")
                         EscrevaL("*ENTER para continuar")
                         Leia(retornoErro)
                      Senao
                         numMatriz[L,num-3] <- x
                         trocaJogadores()
                      Fimse
             //======================================================================================
                   Senao
                      L <- 3
                      Se (numMatriz[L,num-6] = "X") ou (numMatriz[L,num-6] = "O") entao
                         EscrevaL("Lugar já ocupado")
                         EscrevaL("*ENTER para continuar")
                         Leia(retornoErro)
                      Senao
                         numMatriz[L,num-6] <- x
                         trocaJogadores()
                      Fimse
                   Fimse
                Fimse
   //======================================================================
             Senao
                EscrevaL("*ERRO: Opção inválida ")
                EscrevaL("*ENTER para continuar")
                Leia(retornoErro)
             Fimse
             Limpatela
             layoutVelha()
             ExibirPontuacaoJogadores()
   Ate(vencedor = verdadeiro) ou (vezes = 9)
      Se(vencedor = verdadeiro) entao

         EscrevaL("------------------------------------------")
         EscrevaL("PARABÉNS!!! O jogador ", ganhador , " venceu")
         EscrevaL("------------------------------------------")

      Senao
         EscrevaL("VELHA")
      Fimse
      EscrevaL()
      EscrevaL("Deseja continuar? [S/N]")
      Leia(resp)
   Fimenquanto
      EscrevaL()
      EscrevaL("Jogo finalizado com êxito!!!")
      EscrevaL()
      
   Fimprocedimento
   
//==================================REPETIÇÃO DA TROCA DE JOGADORES===============================
   Procedimento trocaJogadores()
      Inicio

      vencedor <- verificarVencedor()
      vezes <- vezes + 1
      nome <- nomeX
         Se (vencedor = falso) entao
            Se (modulo % 2 <> 0) entao //Se for Impar
               x <- "O"
               nome <- nomeO
               ganhador <- nomeO
            Senao
               x <- "X"
               ganhador <- nomeX
               nome <- nomeX
            Fimse
            modulo <- modulo + 1
         Fimse
   Fimprocedimento

//================================ATRIBUI A CONTAGEM A PONTUAÇÃO==============================

   Procedimento pontuacao()
      Inicio
         Se (ganhador = nomeX) entao
            pontuacaoX <- pontuacaoX + 1
         senao
            pontuacaoO <- pontuacaoO + 1
         fimse
   Fimprocedimento

//===================================VERIFICA O VENCEDOR======================================
   Funcao verificarVencedor() : logico
    var
     venceu : logico
      Inicio
       venceu <- falso
         i <- 1
         Para i de 1 ate 3 faca
            Se (numMatriz[i,1] = numMatriz[i,2]) e (numMatriz[i,2] = numMatriz[i,3]) entao
               venceu <- verdadeiro
               pontuacao()
            Senao
               Se (numMatriz[1,i] = numMatriz[2,i]) e (numMatriz[2,i] = numMatriz[3,i]) entao
                  venceu <- verdadeiro
                  pontuacao()
               Fimse
            Fimse
         Fimpara
         
         Se (numMatriz[1,1] = numMatriz[2,2]) e (numMatriz[2,2] = numMatriz[3,3]) entao
            venceu <- verdadeiro
            pontuacao
         Senao
            Se (numMatriz[1,3] = numMatriz[2,2]) e (numMatriz[2,2] = numMatriz[3,1]) entao
               venceu <- verdadeiro
               pontuacao
            Fimse
         Fimse
         
         retorne venceu
   Fimfuncao
   
//===================================EXIBE A PONTUAÇÃO======================================
   
   procedimento ExibirPontuacaoJogadores()
      inicio

         EscrevaL("  INFO")
         EscrevaL()
         EscrevaL("--------------------------------")
         EscrevaL(" Tipo |  Nome      | Pontuação |")
         EscrevaL(" [X]  |  ",nomeX: 10,"|", pontuacaoX:5,"      |")
         EscrevaL(" [O]  |  ",nomeO: 10,"|", pontuacaoO:5,"      |")
         EscrevaL("--------------------------------")
         EscrevaL()
   Fimprocedimento

//================================================================================================

   Procedimento firula()
      Inicio
       tecla <- "'"
         EscrevaL("|============================== BEM VINDO ==========================|")
         EscrevaL("|                                                                   |")
         EscrevaL("|          X X X X X   O O O O    X X X X     O O O O               |")
         EscrevaL("|              X      O       O  X           O       O              |")
         EscrevaL("|              X      O       O  X           O       O              |")
         EscrevaL("|              X      O       O  X    X X    O       O              |")
         EscrevaL("|              X      O       O  X       X   O       O              |")
         EscrevaL("|              X      O       O  X       X   O       O              |")
         EscrevaL("|         X X X        O O O O    X X X X     O O O O               |")
         EscrevaL("|                                                                   |")
         EscrevaL("|                          X X        O                             |")
         EscrevaL("|                          X   X     O O                            |")
         EscrevaL("|                          X   X    O O O                           |")
         EscrevaL("|                          X X     O     O                          |")
         EscrevaL("|                                                                   |")
         EscrevaL("|    X           X  O O O O   X         O       O         X         |")
         EscrevaL("|     X         X   O         X         O       O        X X        |")
         EscrevaL("|      X       X    O         X         O       O       X   X       |")
         EscrevaL("|       X     X     O O O O   X         O O O O O      X     X      |")
         EscrevaL("|        X   X      O         X         O       O     X X X X X     |")
         EscrevaL("|         X X       O         X         O       O    X         X    |")
         EscrevaL("|          X        O O O O   X X X X   O       O   X           X   |")
         EscrevaL("|                                                                   |")
         EscrevaL("|===============================|||||||||===========================|")
         EscrevaL()
         Escreva("                       -> ENTER PARA CONTINUAR !!!  ")
            Se (tecla = "'") entao
               Leia(tecla)
               Limpatela
               firula2()
            Senao
         EscrevaL("Opcção inválida")
            Fimse
            
   Fimprocedimento
   
   Procedimento firula2()
      Inicio
       tecla <- "'"
          EscrevaL()
          EscrevaL()
          EscrevaL("                                    PROJETO")
          EscrevaL("                                 DESENVOLVIDO")
          EscrevaL("                                     PARA")
          EscrevaL("                                   CONCLUSÃO")
          EscrevaL("                                      DO")
          EscrevaL("                                 1º BIMESTRE")
          EscrevaL()
          Escreva("  ")
          EscrevaL()
          EscrevaL()
          EscrevaL()
          EscrevaL()
          EscrevaL()
          EscrevaL()
          EscrevaL()
          EscrevaL(" +-------------+----------------------+")
          EscrevaL(" |             |         Nomes        |")
          EscrevaL(" +-------------+----------------------+")
          EscrevaL(" | *Aluno 1    |  Joabe Galvão Lopes  |")
          EscrevaL(" +-------------+----------------------+        -> ENTER PARA CONTINUAR !!!")
          EscrevaL(" | *Aluno 2    |  Rodrigo Silva Testa |")
          EscrevaL(" +-------------+----------------------+")
          EscrevaL(" | *Professor  |  Júlio Serra         |")
          EscrevaL(" +-------------+----------------------+")

             Se (tecla = "'") entao
                  Leia(tecla)
                  Limpatela
                  preencherMatriz()
                  layoutVelha()
                  jogar()
             Senao
         EscrevaL("Opcção inválida")
             Fimse
      
   Fimprocedimento


var

   i : inteiro
   j : inteiro
   cont : inteiro
   numMatriz : vetor[1..3,1..3] de caractere
   L : inteiro
   x : caractere
   num : inteiro
   vencedor : logico
   vezes : inteiro
   modulo : inteiro
   retornoErro : caractere
   resp : caractere
   nomeX : caractere
   nomeO : caractere
   ganhador : caractere
   nome : caractere
   pontuacaoX : inteiro
   pontuacaoO : inteiro
   tecla : caractere
   


inicio
   firula()


fimalgoritmo
