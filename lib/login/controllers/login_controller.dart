import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_job_front/core/controller/navigation_controller.dart';
import 'package:scraping_job_front/dashboard/pages/dashboard.dart';

class LoginController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    final navCtrl = Get.find<NavigationController>();
    navCtrl.changeScreen(Dashboard());
  }

}