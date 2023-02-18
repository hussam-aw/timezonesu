// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/get_routes.dart';

class AuthController extends GetxController {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerRepasswordController = TextEditingController();
  TextEditingController registerWhatsappController = TextEditingController();

  Future<void> login() async {
    //TODO : SURA Make Login Request

    print("login");
    Get.toNamed(AppRoutes.homepage);
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.registerscreen);
  }
}
