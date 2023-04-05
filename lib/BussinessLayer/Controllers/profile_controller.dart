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
  TextEditingController updateNameController =
      TextEditingController(text: MyApp.appUser!.name);
  TextEditingController updateEmailController =
      TextEditingController(text: MyApp.appUser!.email);
  TextEditingController updatePasswwordController =
      TextEditingController(text: '********');
  TextEditingController updateAddressController =
      TextEditingController(text: MyApp.appUser!.address);
  TextEditingController updateMobileController =
      TextEditingController(text: MyApp.appUser!.mobileNumber);

  Future<void> updateInfo() async {
    User? user;
    String name = updateNameController.value.text;
    String email = updateEmailController.value.text;
    String password = updatePasswwordController.value.text;
    String address = updateAddressController.value.text;
    String mobileNumber = updateMobileController.value.text;
    if (email.isNotEmpty) {
      if (name.isNotEmpty) {
        user = await userRepo.updateInfo(
            MyApp.appUser!.id, name, email, password, address, mobileNumber);
      } else {
        user = await userRepo.updateInfo(MyApp.appUser!.id, MyApp.appUser!.name,
            email, password, address, mobileNumber);
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
