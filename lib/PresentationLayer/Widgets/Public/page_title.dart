import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

import '../../../Constants/ui_text_style.dart';

Widget pageTitle(String title, {bool isBlue = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
    child: Text(
      title,
      style: isBlue
          ? UITextStyle.boldHeading.apply(color: UIColors.primary)
          : UITextStyle.boldHeading,
    ),
  );
}
