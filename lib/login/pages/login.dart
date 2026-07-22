import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_job_front/login/controllers/login_controller.dart';
import 'package:scraping_job_front/utils/constants.dart';
import 'package:scraping_job_front/utils/my_colors.dart';
import 'package:scraping_job_front/utils/widgets/my_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://t4.ftcdn.net/jpg/09/02/53/81/360_F_902538150_JCEcejSQkRHHR7d5jE1nbmfhXHdcd9E3.jpg'),
          fit: BoxFit.cover,
          opacity: 0.5,
        )
      ),
      child: GetBuilder(
        init: Get.find<LoginController>(),
        builder: (controller) {
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container()),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: Image.network(
                    'https://img.freepik.com/premium-vector/scrapinger-icon-vector-image-can-be-used-bakery_120816-62884.jpg',
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(
                  'Scrapinging Work',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(color: Colors.white, blurRadius: 5)
                    ]
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    spacing: defaultPadding,
                    children: [
                      MyTextField(
                        controller.emailController,
                        hintText: 'E-mail',
                        // fillColor: Colors.red,
                      ),
                      MyTextField(
                        controller.passwordController,
                        hintText: 'Password',
                        // fillColor: Colors.red,
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () async => await controller.login(),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(secondaryColor)
                  ),
                  child: SizedBox(
                    width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Login', style: TextStyle(color: Colors.black)),
                        Icon(Icons.login_rounded, color: Colors.black)
                      ],
                    ),
                  )
                ),
                Expanded(child: Container()),
              ],
            )
          );
        }
      ),
    );
  }
}