import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Helpers/box_client.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/main.dart';

class UserController extends GetxController {
  BoxClient boxClient = BoxClient();
  Future<void> logout() async {
    await boxClient.removeUserData();
    MyApp.appUser = null;
    Get.toNamed(AppRoutes.loginscreen);
  }

  Future<void> gotoLogin() async {
    Get.toNamed(AppRoutes.loginscreen);
  }
}
