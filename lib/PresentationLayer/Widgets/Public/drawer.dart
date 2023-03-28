import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/app_language_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/user_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/main.dart';

import '../../../Constants/get_routes.dart';

class TzDrawer extends StatelessWidget {
  TzDrawer({super.key});
  final UserController userController = Get.put(UserController());
  final AppLanguageController appLanguageController =
      Get.find<AppLanguageController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: GetBuilder(
            init: userController,
            builder: (context) {
              return Container(
                padding: EdgeInsets.zero,
                color: UIColors.blue,
                child: ListView(
                  children: [
                    UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(color: UIColors.red),
                        currentAccountPicture: const CircleAvatar(
                          backgroundColor: UIColors.lightGrey,
                          backgroundImage:
                              AssetImage("assets/images/user-default.png"),
                        ),
                        accountName: Text(
                          MyApp.appUser != null
                              ? MyApp.appUser!.name
                              : 'timezoneUserTitle'.tr,
                        ),
                        accountEmail: Text(
                            MyApp.appUser != null ? MyApp.appUser!.email : "")),
                    if (MyApp.appUser != null)
                      ListTile(
                        onTap: () => Get.toNamed(AppRoutes.profileScreen),
                        title: Text(
                          'profileTitle'.tr,
                          style:
                              UITextStyle.boldMeduim.apply(fontSizeFactor: .8),
                        ),
                        leading: const Icon(
                          Icons.people,
                          color: UIColors.activeIcon,
                        ),
                      ),
                    if (MyApp.appUser == null)
                      ListTile(
                        onTap: () async => userController.gotoLogin(),
                        title: Text(
                          'loginText'.tr,
                          style:
                              UITextStyle.boldMeduim.apply(fontSizeFactor: .8),
                        ),
                        leading: const Icon(
                          Icons.people,
                          color: UIColors.activeIcon,
                        ),
                      ),
                    ListTile(
                      title: Text(
                        'homeTitle'.tr,
                        style: UITextStyle.boldMeduim.apply(fontSizeFactor: .8),
                      ),
                      leading: const Icon(
                        Icons.home,
                        color: UIColors.activeIcon,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'categoriesTitle'.tr,
                        style: UITextStyle.boldMeduim.apply(fontSizeFactor: .8),
                      ),
                      leading: const Icon(Icons.category,
                          color: UIColors.activeIcon),
                    ),
                    ListTile(
                      title: Text(
                        'topSalesTitle'.tr,
                        style: UITextStyle.boldMeduim.apply(fontSizeFactor: .8),
                      ),
                      leading: const Icon(Icons.shopping_bag,
                          color: UIColors.activeIcon),
                    ),
                    if (MyApp.appUser != null)
                      ListTile(
                        onTap: () async => userController.logout(),
                        title: Text(
                          'logoutText'.tr,
                          style:
                              UITextStyle.boldMeduim.apply(fontSizeFactor: .8),
                        ),
                        leading: const Icon(
                          Icons.logout,
                          color: UIColors.activeIcon,
                        ),
                      ),
                    ListTile(
                      title: Text(
                        'languageTitle'.tr,
                        style: UITextStyle.boldMeduim.apply(fontSizeFactor: .8),
                      ),
                      leading: const Icon(Icons.language,
                          color: UIColors.activeIcon),
                      trailing: DropdownButton(
                        underline: const SizedBox(),
                        style: UITextStyle.boldMeduim.copyWith(
                          color: UIColors.normalText,
                        ),
                        value: appLanguageController.appLang,
                        items: [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text('enLanguage'.tr),
                          ),
                          DropdownMenuItem<String>(
                            value: 'ar',
                            child: Text('arLanguage'.tr),
                          ),
                        ],
                        onChanged: (value) {
                          appLanguageController.changeLanguage(value);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
