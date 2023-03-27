import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Helpers/box_client.dart';

class AppLanguageController extends GetxController {
  String? appLang;
  late Locale? appLocale;
  BoxClient box = BoxClient();
  @override
  void onInit() async {
    super.onInit();
    appLang = await box.getAppLanguage();
    if (appLang == null) {
      appLang = Get.deviceLocale!.languageCode;
      appLocale = Get.deviceLocale;
    } else {
      appLocale = Locale(appLang.toString());
    }
    update();
    Get.updateLocale(appLocale!);
  }

  void changeLanguage(String? type) async {
    if (appLang == type) {
      return;
    }
    switch (type) {
      case 'ar':
        appLang = 'ar';
        break;
      case 'en':
        appLang = 'en';
        break;
    }
    box.setAppLanguage(appLang.toString());
    update();
    Get.updateLocale(Locale(type.toString()));
  }
}
