import 'package:flutter/material.dart';
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
    leading: leading,
    actions: actions,
  );
}
