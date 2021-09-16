import 'package:get/get.dart';
import 'package:projeto_perguntas/modules/home/bindings/home_binding.dart';
import 'package:projeto_perguntas/modules/home/views/home_page.dart';

import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
