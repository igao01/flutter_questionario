import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final String perguntaSelecionada;
  final List<Map<String, dynamic>> respostas;
  final void Function(int) responder;

  Questionario({
    Key? key,
    required this.perguntaSelecionada,
    required this.respostas,
    required this.responder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(texto: perguntaSelecionada),
        // operador spread funciona como um laco de repeticao
        ...respostas
            .map((resp) => Resposta(
                  texto: resp['texto'].toString(),

                  //quandoSelecionado é uma funcao void que nao recebe parametro
                  // sendo assim é necessario passar uma funcao anonima que chame outra funcao
                  // que recebe o parametro

                  // chama a funcao responder passando a pontuacao como parametro
                  quandoSelecionado: () => responder(resp['pontuacao']),
                ))
            .toList(),
      ],
    );
  }
}
