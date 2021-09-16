import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_perguntas/modules/home/controllers/home_controller.dart';

import 'widgets/questionario.dart';
import 'widgets/resultado.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Obx(
          () => controller.temPerguntaSelecionada.value
              ? Questionario(
                  perguntaSelecionada:
                      controller.perguntas[controller.indexPerguntaSelecionada.value].cast()['pergunta'],
                  responder: (pontuacao) => controller.responder(pontuacao),
                  respostas: controller.perguntas[controller.indexPerguntaSelecionada.toInt()]['respostas'],
                )
              : Resultado(
                  reset: controller.reiniciar,
                  pontuacao: controller.pontuacaoTotal.value,
                ),
        ),
      ),
    );
  }
}
