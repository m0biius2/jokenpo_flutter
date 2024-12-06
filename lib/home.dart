import 'package:flutter/material.dart';
import 'dart:math';

// stateful home 1
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// stateful home 2
class _HomeState extends State<Home> {
  // atributos
  // imagens
  var _escolhaApp = "images/padrao.png";
  var _voce = "";
  // mensagem inicial
  var _resultado = "Escolha uma opção abaixo";
  // imagens das opcoes
  var _papel = "images/papel.png";
  var _pedra = "images/pedra.png";
  var _tesoura = "images/tesoura.png";
  // placar
  var _placarVc = 0;
  var _placarAp = 0;

  // metodos
  // metodo que gera uma imagem de opcao da escolha do app
  void _gerarImagem(){
    List opcoes = [this._pedra, this._papel, this._tesoura];

    // gerador de numero random (0, 1, 2)
    var _gerarNum = Random().nextInt(opcoes.length);

    // configura a escolha do app de acordo com o numero random
    this._escolhaApp = opcoes[_gerarNum];
  }

  // metodo que verifica se houve vitoria, derrota ou empate, exibe na tela e muda o placar
  String _pontos(){
    // vitoria
    if(this._voce == this._pedra && this._escolhaApp == this._tesoura || this._voce == this._papel && this._escolhaApp == this._pedra || this._voce == this._tesoura && this._escolhaApp == this._papel){
      setState((){
        this._resultado = "Você ganhou!";
      });

      this._placarVc++;
    }
    // derrota
    else if(this._escolhaApp == this._pedra && this._voce == this._tesoura || this._escolhaApp == this._papel && this._voce == this._pedra || this._escolhaApp == this._tesoura && this._voce == this._papel){
      setState((){
        this._resultado = "Você perdeu!";
      });

      this._placarAp++;
    }
    // empate
    else if(this._escolhaApp == this._pedra && this._voce == this._pedra || this._escolhaApp == this._papel && this._voce == this._papel || this._escolhaApp == this._tesoura && this._voce == this._tesoura){
      setState((){
        this._resultado = "Empate!";
      });
    }

    return this._resultado;
  }

  void _resetar(){
    setState((){
      this._escolhaApp = "images/padrao.png";

      this._resultado = "Escolha uma opção abaixo";

      this._placarVc = 0;

      this._placarAp = 0;
    });
  }

  // metodo sobrescrito com o app
  @override
  Widget build(BuildContext context) {
    // esqueleto
    return Scaffold(
      // barra start
      appBar: AppBar(
        // direita
          leading:  Icon(
            Icons.handshake_rounded,
            color: Colors.white,
            size: 28,
          ),
          // centro
          title: Text(
            "JokenPo",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 23
            ),
          ),
          backgroundColor: Colors.red[800]
      ),
      // corpo
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          // ajuste na tela
          width: double.infinity,
          child: Column(
            // alinhamento
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 15)
                  ),
                  // titulo escolha do app
                  Text(
                    "Escolha do App",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  // espaco
                  Padding(
                      padding: EdgeInsets.only(top: 15)
                  ),
                  // imagem da escolha do app
                  Image.asset(
                    this._escolhaApp,
                    fit: BoxFit.scaleDown,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20)
                  ),
                  // mensagem de aviso se ganhou, perdeu ou empatou
                  Text(
                    this._pontos(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20)
              ),
              Row(
                // alinhamento
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // imagens opcao de escolha
                  // pedra
                  GestureDetector(
                    // quando a imagem e clicada
                    onTap: (){
                      setState((){
                        // configura o valor da variavel para saber o que o user escolheu
                        this._voce = this._pedra;

                        this._gerarImagem();
                      });
                    },
                    child: Image.asset(
                        this._pedra,
                        fit: BoxFit.scaleDown,
                        height: 100,
                        width: 100
                    ),
                  ),
                  // papel
                  GestureDetector(
                    onTap: (){
                      setState((){
                        this._voce = this._papel;

                        this._gerarImagem();
                      });
                    },
                    child: Image.asset(
                        this._papel,
                        fit: BoxFit.scaleDown,
                        height: 100,
                        width: 100
                    ),
                  ),
                  // tesoura
                  GestureDetector(
                    onTap: (){
                      setState((){
                        this._voce = this._tesoura;

                        this._gerarImagem();
                      });
                    },
                    child: Image.asset(
                        _tesoura,
                        fit: BoxFit.scaleDown,
                        height: 100,
                        width: 100
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30)
              ),
              Row(
                // alinhamento
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // placar voce
                  Text(
                    "VOCÊ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  // placar app
                  Text(
                    "APP",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20)
              ),
              Row(
                // alinhamento
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // pontos do placar voce
                  Text(
                    this._placarVc.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  // pontos do placar app
                  Text(
                    this._placarAp.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30)
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                      ),
                      onPressed: (){
                        _resetar();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              "Reiniciar",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              )
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
                          Icon(
                            Icons.replay_rounded,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ],
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
