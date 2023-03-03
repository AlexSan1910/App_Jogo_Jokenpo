import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("image/padrao.png"); // criamos essa variavel, pois em um determinado momento desejaremos alterar o valor dessa variavel que neste caso seria a imagem.
  var _mensagem = "Escolha uma opção abaixo"; // Criamos essa variavel para a mensagem que será printada na tela do app, pois eventualmente precisaremos mudar a mensagem que será mostrada, para vitoria, derrota ou empate.
  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"]; // uma lista com três ingredientes, no caso as opções do jogo
    var numero = Random().nextInt(3);// gerar um numero aleatorio de 0 a 2
    var escolhaApp = opcoes[numero];// puxando o index do do numero aleatorio, nos retornando uma das opções da nossa lista

    print("Escolha do App: " + escolhaApp); // apenas para mostrar e validar qual a escolha do app
    print("Escolha do Usuario: " + escolhaUsuario); // apenas para mostrar e validar qual a escolha do usuario


    switch(escolhaApp){ // basicamente com essa condição iremos mostrar a imagem na tela do usuario de acordo com qual opção daquela lista que a maquina selecionou

      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("image/pedra.png");// se maquina selecionou a opção pedra, irá chamar a imagem pedra para mostrar na tela
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("image/papel.png");// se maquina selecionou a opção papel, irá chamar a imagem papel para mostrar na tela
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("image/tesoura.png");// se maquina selecionou a opção tesoura, irá chamar a imagem tasoura para mostrar na tela
        });
        break;

    }

    // Validação ganhador
    if( // condição para identificarmos quais condições fará a maquina vencedora 
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel"  && escolhaApp == "pedra")
      ){

        setState(() {
          _mensagem = "Parabéns! você ganhou!"; 
        });
        
      }
    else if(// condição para identificarmos quais condições fará o usuario vencedor
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
      
    ) {
      setState(() {
          _mensagem = "Infelizmente a maquina ganhou"; 
        });
      
    }else {// condição para definir um empate, neste caso se não for nenhuma das condições acima, selecionará essa opção indicando empate.
      setState(() {
        _mensagem = "Houve um empate";
      });
      
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // appbar com o nome do jogo.
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1) text
          //2) imagem
          //3) text resultado
          //4) Linha 3 imagens
          Padding( // local onde mostrará as opções selecionada pela maquina
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
         Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(_mensagem, // local que mostrará a mensagem de empate, vitoria ou derrota
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(// opções que o usuario terá oportunidade de escolher
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(// utilizando o gesture Detector para detectar toques na tela para eventuais execuções de atividades a partir desse toque
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("image/pedra.png"),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("image/papel.png"),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("image/tesoura.png"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
