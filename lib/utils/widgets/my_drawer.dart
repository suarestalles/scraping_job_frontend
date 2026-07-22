import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scraping_job_front/core/controller/navigation_controller.dart';
import 'package:scraping_job_front/login/pages/login.dart';
import 'package:scraping_job_front/utils/constants.dart';
import 'package:scraping_job_front/utils/controllers/my_drawer_controller.dart';
import 'package:scraping_job_front/utils/my_colors.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyDrawerController());
    List menus = [
      'Option 1',
      'Option 2',
      'Option 3',
      'Option 4',
      'Option 5',
      'Option 6',
    ];
    return Drawer(
      backgroundColor: secondaryColor,
      child: GetBuilder(
        init: Get.find<MyDrawerController>(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: primaryColor
                ),
                padding: EdgeInsets.only(
                  top: 32.0,
                  bottom: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: defaultPadding,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: defaultPadding,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1511367461989-f85a21fda167?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('User Name', style: TextStyle(color: Colors.white),),
                            Text('User e-mail', style: TextStyle(color: Colors.white),),
                            Text('User phone', style: TextStyle(color: Colors.white),),
                            IconButton(
                              onPressed: () => controller.showProfileDialog(),
                              icon: Icon(Icons.edit, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      'User role preferences',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Column(
                children: menus.map((menu) => IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(menu,),
                      Icon(Icons.work)
                    ],
                  ),
                )).toList(),
              ),
              Expanded(child: Container()),
              Container(
                height: MediaQuery.of(context).size.height * 0.075,
                decoration: BoxDecoration(
                  color: primaryColor
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  onTap: () {
                    final navCtrl = Get.find<NavigationController>();
                    navCtrl.changeScreen(Login());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Exit', style: TextStyle(color: Colors.white),),
                      Icon(Icons.exit_to_app, color: Colors.white,)
                    ],
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}