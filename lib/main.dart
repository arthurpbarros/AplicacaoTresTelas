import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaInicial()));
}

class TelaInicial extends StatelessWidget {
  String nome = "";
  Widget build(BuildContext bc) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Inicial")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 400,
              child: TextField(
                  onChanged: (texto) {
                    nome = texto;
                  },
                  decoration: InputDecoration(icon: Icon(Icons.accessibility), hintText: "Digite seu nome"))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                  onPressed: () {
                    //Normal Style
                    Navigator.of(bc).push(MaterialPageRoute(builder: (bc) => PrimeiraTela(nome)));
                  },
                  child: Text("Primeira Tela")),
              FloatingActionButton(
                  onPressed: () {
                    //Normal Style
                    Navigator.of(bc).push(MaterialPageRoute(builder: (bc) => SegundaTela(nome)));
                  },
                  child: Text("Segunda tela"))
            ],
          )
        ],
      ),
    );
  }
}

class PrimeiraTela extends StatelessWidget {
  String parametro = "";
  PrimeiraTela(parametro) {
    this.parametro = parametro;
  }
  Widget build(BuildContext bc) {
    return Scaffold(
        appBar: AppBar(title: Text("Primeira Tela")),
        body: Center(
            child: Column(
          children: <Widget>[
            Text("Saudações $parametro"),
            FloatingActionButton(child: Text("Voltar"), onPressed: () => Navigator.pop(bc)),
            FloatingActionButton(
                child: Text("Segunda tela"),
                onPressed: () {
                  Navigator.of(bc).push(MaterialPageRoute(builder: (bc) => SegundaTela(parametro)));
                })
          ],
        )));
  }
}

class SegundaTela extends StatelessWidget {
  String parametro = "";
  SegundaTela(parametro) {
    this.parametro = parametro;
  }
  Widget build(BuildContext bc) {
    return Scaffold(
        appBar: AppBar(title: Text("Segunda Tela")),
        body: Center(
            child: Column(
          children: <Widget>[
            Text("Saudações $parametro"),
            FloatingActionButton(child: Text("Voltar"), onPressed: () => Navigator.pop(bc)),
            FloatingActionButton(
                child: Text("Primeiratela"),
                onPressed: () {
                  Navigator.of(bc).push(MaterialPageRoute(builder: (bc) => PrimeiraTela(parametro)));
                })
          ],
        )));
  }
}
