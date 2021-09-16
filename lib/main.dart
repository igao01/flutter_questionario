import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_perguntas/routes/pages.dart';

import 'routes/routes.dart';

main() {
  runApp(GetMaterialApp(
    title: 'Questionario',
    debugShowCheckedModeBanner: false,
    getPages: AppPages.routes,
    initialRoute: Routes.INITIAL,
  ));
}
