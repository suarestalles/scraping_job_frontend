import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_job_front/dashboard/pages/dashboard.dart';

class NavigationController extends GetxController {
  var currentScreen = Rx<Widget>(Dashboard()); // Tela inicial

  void changeScreen(Widget screen) {
    currentScreen.value = screen;
    Get.back(); // Fecha o Drawer automaticamente ao clicar
  }
}