import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/splash_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: Get.width / 1.4,
          ),
        ),
      ),
      bottomSheet: const LinearProgressIndicator(
        value: 0.7,
        minHeight: 14,
        backgroundColor: UIColors.defaultProgress,
        valueColor: AlwaysStoppedAnimation<Color>(UIColors.primary),
      ),
    );
  }
}
