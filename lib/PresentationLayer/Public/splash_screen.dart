import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
      bottomSheet: LinearProgressIndicator(
        value: 0.7,
        minHeight: 14,
        backgroundColor: UIColors.defaultProgress,
        valueColor: AlwaysStoppedAnimation<Color>(UIColors.primary),
      ),
    );
  }
}
