import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_job_front/core/controller/navigation_controller.dart';
import 'package:scraping_job_front/login/pages/login.dart';
import 'package:scraping_job_front/utils/constants.dart';
import 'package:scraping_job_front/utils/my_theme.dart';
import 'package:scraping_job_front/utils/widgets/my_drawer.dart';
import 'package:scraping_job_front/utils/my_colors.dart';

void main() {
  Get.lazyPut(() => NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navCtrl = Get.find<NavigationController>();
    return GetMaterialApp(
      title: 'Scrapinging Work',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Obx(
        () {
          bool hideAppBar = navCtrl.currentScreen.value is Login;
          return Scaffold(
            appBar: hideAppBar
              ? null
              : AppBar(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  title: Row(
                    spacing: defaultPadding,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://img.freepik.com/premium-vector/scrapinger-icon-vector-image-can-be-used-bakery_120816-62884.jpg',
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text('Scrapinging Work', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                    ],
                  ),
                ),
            drawer: MyDrawer(),
            body: Obx(() => navCtrl.currentScreen.value),
          );
        }
      ),
    );
  }
}