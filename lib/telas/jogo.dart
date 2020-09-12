import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("img/padrao.png");

  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["Pedra", "Papel", "Tesoura"];

    var numero = Random().nextInt(3);

    var escolhaApp = opcoes[numero];

    print("Escolha do APP: " + escolhaApp);

    print("Escolha do Usuário: " + escolhaUsuario);

    switch (escolhaApp) {
      case "Pedra":
        setState(() {
          _imagemApp = AssetImage("img/pedra.png");
        });
        break;
      case "Papel":
        setState(() {
          _imagemApp = AssetImage("img/papel.png");
        });
        break;
      case "Tesoura":
        setState(() {
          _imagemApp = AssetImage("img/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "Pedra" && escolhaApp == "Tesoura") ||
        (escolhaUsuario == "Tesoura" && escolhaApp == "Papel") ||
        (escolhaUsuario == "Papel" && escolhaApp == "Pedra")) {
      setState(() {
        this._mensagem = "Parabéns, você venceu! :D";
      });
    } else if ((escolhaApp == "Pedra" && escolhaUsuario == "Tesoura") ||
        (escolhaApp == "Tesoura" && escolhaUsuario == "Papel") ||
        (escolhaApp == "Papel" && escolhaUsuario == "Pedra")) {
      setState(() {
        this._mensagem = "Ah não, você perdeu! :'(";
      });
    } else {
      setState(() {
        this._mensagem = "É um empate! :|";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha da CPU",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _opcaoSelecionada('Pedra'),
                  child: Image.asset("img/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('Papel'),
                  child: Image.asset("img/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('Tesoura'),
                  child: Image.asset("img/tesoura.png", height: 100),
                ),
              ])
        ],
      ),
    );
  }
}
