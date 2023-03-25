import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezonesu/Constants/get_pages.dart';

import 'DataAccesslayer/Models/user.dart';

void main() async {
  //LocalNotificationService.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static User? appUser;
  static int bottomSelectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimeZone',
      getPages: getPages,
    );
  }
}
