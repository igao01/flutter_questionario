import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'pergunta': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    print('Pergunta respondida');
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas =
        temPerguntaSelecionada ? _perguntas[_perguntaSelecionada].cast()['respostas'] : [];

    // MAP TRANSFORMA UMA LISTA EM OUTRA LISTA DE UM
    // TIPO DIFERENTE E COM O MESMO TAMANHO

    // transforma um lista de respostas em uma lista de widgetResposta
    /*List<Widget> widgetRespostas = respostas
        .map((textoResposta) => Resposta(
              texto: textoResposta,
              quandoSelecionado: _responder,
            ))
        .toList();*/

    /*for (String textoResp
        in _perguntas[_perguntaSelecionada].cast()['respostas']) {
      // adiciona o widget na lista
      widgetRespostas
          .add(Resposta(texto: textoResp, quandoSelecionado: _responder));
    }*/

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntas[_perguntaSelecionada].cast()['pergunta'],
                responder: _responder,
                respostas: respostas,
              )
            : Resultado(
                reset: _reiniciar,
                pontuacao: _pontuacaoTotal,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaApp({key}) : super(key: key);

// cria o estado
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
