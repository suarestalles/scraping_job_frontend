import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color get primaryColor => Get.isDarkMode ? Colors.purple : Colors.black;
Color get secondaryColor => Get.isDarkMode ? Colors.white : Color.fromRGBO(95, 222, 239, 1);
Color get tertiaryColor => Get.isDarkMode ? Colors.amber : Color.fromRGBO(8, 8, 99, 1);
Color get cardColor => Get.isDarkMode ? Colors.white : Color.fromRGBO(95, 222, 239, 1);