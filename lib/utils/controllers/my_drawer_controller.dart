import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_job_front/login/pages/login.dart';
import 'package:scraping_job_front/utils/constants.dart';
import 'package:scraping_job_front/utils/my_colors.dart';
import 'package:scraping_job_front/utils/widgets/my_text_field.dart';

class MyDrawerController extends GetxController {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final keyWordsController = TextEditingController();

  void showProfileDialog() {
    Get.back();
    Get.defaultDialog(
      title: 'Edit Profile',
      content: Center(
        child: Column(
          spacing: defaultPadding,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: Image.network(
                    'https://img.freepik.com/vetores-gratis/circulos-de-utilizadores-definidos_78370-4704.jpg?semt=ais_hybrid&w=740&q=80',
                    width: 200,
                    height: 200,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                )
              ]
            ),
            MyTextField(
              nameController,
              hintText: 'Name',
            ),
            MyTextField(
              emailController,
              hintText: 'E-mail',
            ),
            MyTextField(
              phoneController,
              hintText: 'Key Words',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                  ),
                  child: Text('Close'),
                ),
                ElevatedButton(
                  onPressed: () => updated(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(secondaryColor),
                  ),
                  child: Text('Update'),
                ),
              ],
            )
          ],
        ),
      )
    );
  }

  Future<void> updated() async {
    log('Updating...');
  }

  Future<void> logout() async {
    Get.to(() => Login());
  }

}