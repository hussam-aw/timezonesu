import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Helpers/box_client.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';

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

  void showLanguageDialog() async {
    await Get.dialog(Center(
      child: Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.all(15),
        decoration:
            const BoxDecoration(color: UIColors.white, borderRadius: raduis30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: normalButtonStyle,
                  onPressed: () {
                    changeLanguage("ar");
                  },
                  child: Text(
                    'arLanguage'.tr,
                    style: UITextStyle.boldMeduim.apply(color: UIColors.blue),
                  )),
              ElevatedButton(
                  style: normalButtonStyle,
                  onPressed: () {
                    changeLanguage("en");
                  },
                  child: Text('enLanguage'.tr,
                      style:
                          UITextStyle.boldMeduim.apply(color: UIColors.blue))),
            ],
          ),
        ),
      ),
    ));
  }
}
