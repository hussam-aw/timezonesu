import 'package:get/get.dart';
import 'package:timezonesu/main.dart';

import '../../Constants/get_routes.dart';
import '../Helpers/box_client.dart';

class SplashController extends GetxController {
  final BoxClient boxClient = BoxClient();

  Future<void> checkAuth() async {
    bool authed = await boxClient.getAuthState();
    if (authed == true) {
      MyApp.appUser = await boxClient.getAuthedUser();
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAndToNamed(AppRoutes.homepage));
    } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.offAndToNamed(AppRoutes.loginscreen));
    }
  }

  @override
  void onInit() async {
    await checkAuth();
    super.onInit();
  }
}
