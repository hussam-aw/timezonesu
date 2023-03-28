// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Helpers/box_client.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/DataAccesslayer/Models/user.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/user_repo.dart';
import 'package:timezonesu/PresentationLayer/Widgets/snackbars.dart';
import 'package:timezonesu/main.dart';

class AuthController extends GetxController {
  UserRepo userRepo = UserRepo();
  BoxClient client = BoxClient();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerRepasswordController = TextEditingController();
  TextEditingController registerWhatsappController = TextEditingController();

  var logging = false.obs;
  Future<void> login() async {
    logging.value = true;
    if (loginEmailController.value.text.isNotEmpty &&
        loginPasswordController.value.text.isNotEmpty) {
      User? user = await userRepo.login(
          loginEmailController.value.text, loginPasswordController.value.text);
      if (user != null) {
        MyApp.appUser = user;
        await client.setAuthedUser(user);
        SnackBars.showSuccess('welcomeMessage'.tr + "${user.name}");
        Get.toNamed(AppRoutes.homepage);
      } else {
        SnackBars.showWarning('notMatchMessage'.tr);
      }
    } else {
      SnackBars.showWarning('requiredFieldMessage'.tr);
    }
    logging.value = false;
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.registerscreen);
  }
}
