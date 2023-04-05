import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

PreferredSizeWidget tzAppBar(
    {Widget? leading, List<Widget> actions = const []}) {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: UIColors.primary,
    title: Image.asset(
      'assets/images/logo-gold.png',
      width: 100,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(24),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Get.toNamed(AppRoutes.cartScreen);
        },
        icon: const Icon(
          Icons.shopping_cart,
          size: 30,
          color: UIColors.activeIcon,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          size: 30,
          color: UIColors.activeIcon,
        ),
      ),
      const SizedBox(width: 8),
    ],
  );
}
