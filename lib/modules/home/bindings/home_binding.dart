import 'package:get/get.dart';
import 'package:projeto_perguntas/data/repositories/home_repository.dart';
import 'package:projeto_perguntas/modules/home/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeRepository>(() => HomeRepository());
  }
}
