import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Helpers/box_client.dart';
import 'package:timezonesu/DataAccesslayer/Models/user.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/user_repo.dart';
import 'package:timezonesu/PresentationLayer/Widgets/snackbars.dart';
import 'package:timezonesu/main.dart';

class ProfileController extends GetxController {
  UserRepo userRepo = UserRepo();
  BoxClient boxClient = BoxClient();
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();

  Future<void> updateInfo() async {
    User? user;
    if (updateEmailController.value.text.isNotEmpty) {
      if (updateNameController.value.text.isNotEmpty) {
        user = await userRepo.updateInfo(
          MyApp.appUser!.id,
          updateNameController.value.text,
          updateEmailController.value.text,
          MyApp.appUser!.mobileNumber,
        );
      } else {
        user = await userRepo.updateInfo(
          MyApp.appUser!.id,
          MyApp.appUser!.name,
          updateEmailController.value.text,
          MyApp.appUser!.mobileNumber,
        );
      }
      if (user != null) {
        MyApp.appUser = user;
        await boxClient.setAuthedUser(user);
        SnackBars.showSuccess('updateSuccessMessage'.tr);
        update();
      }
    } else {
      SnackBars.showWarning('requiredFieldMessage'.tr);
    }
  }
}
