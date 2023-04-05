import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

Widget loadingItem(bool isBlue, {double size = 40}) {
  return LottieBuilder.asset(
    isBlue
        ? "assets/images/loading-blue.json"
        : "assets/images/loading-white.json",
    height: size,
    width: size,
  );
}
