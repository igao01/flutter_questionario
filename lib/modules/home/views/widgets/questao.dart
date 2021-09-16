import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  Questao({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // pega o tamanho maximo do double e passa para o width
      width: double.infinity,
      margin: EdgeInsets.all(16),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        //alinha o conteudo no centro do widget pai
        textAlign: TextAlign.center,
      ),
    );
  }
}
