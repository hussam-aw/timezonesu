import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

class TransparentHeader extends StatelessWidget {
  const TransparentHeader({super.key, this.trailling});

  final Widget? trailling;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            UIColors.darkGrey,
            UIColors.white.withOpacity(0.1),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: UIColors.activeIcon,
              ),
            ),
            trailling ?? Container(),
          ],
        ),
      ),
    );
  }
}
