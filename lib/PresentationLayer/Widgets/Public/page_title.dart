import 'package:flutter/material.dart';

import '../../../Constants/ui_text_style.dart';

Widget pageTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
    child: Text(
      title,
      style: UITextStyle.boldHeading,
    ),
  );
}
