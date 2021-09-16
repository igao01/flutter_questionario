import 'package:get/get.dart';
import 'package:projeto_perguntas/data/repositories/home_repository.dart';

class HomeController extends GetxController {
  final rep = Get.find<HomeRepository>();

  var indexPerguntaSelecionada = 0.obs;
  var pontuacaoTotal = 0.obs;
  var perguntaSelecionada = '';
  var temPerguntaSelecionada = true.obs;

  List<Map<String, dynamic>> perguntas = [];

  @override
  void onInit() {
    // pega as perguntas no repositorio
    perguntas = rep.perguntas;
    // pega a primeira pergunta
    perguntaSelecionada = perguntas[indexPerguntaSelecionada.toInt()].toString();
    super.onInit();
  }

  void responder(int pontuacao) {
    indexPerguntaSelecionada.value = indexPerguntaSelecionada.value + 1;
    pontuacaoTotal.value = pontuacaoTotal.value + pontuacao;
    verificarPerguntaSelecionada();
  }

  void reiniciar() {
    indexPerguntaSelecionada.value = 0;
    pontuacaoTotal.value = 0;
    temPerguntaSelecionada.value = true;
  }

  void verificarPerguntaSelecionada() {
    indexPerguntaSelecionada.value < perguntas.length
        ? temPerguntaSelecionada.value = true
        : temPerguntaSelecionada.value = false;
  }
}
