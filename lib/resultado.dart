import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() reset;
  final int pontuacao;

  Resultado({Key? key, required this.reset, required this.pontuacao}) : super(key: key);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          fraseResultado,
          style: TextStyle(fontSize: 24),
        )),
        ElevatedButton(
          onPressed: reset,
          child: Text('Reiniciar'),
        )
      ],
    );
  }
}
