import 'package:flutter/material.dart';

import '../../../Constants/ui_colors.dart';
import '../../../Constants/ui_styles.dart';
import '../../../Constants/ui_text_style.dart';

Widget paymentMethodItem(IconData icon, String text, bool selected) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: raduis10,
      color: selected ? UIColors.white : UIColors.lightGrey,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: selected ? UIColors.primary : UIColors.white,
        ),
        Text(
          text,
          style: UITextStyle.normalBody.apply(
              color: selected ? UIColors.primary : UIColors.white,
              fontWeightDelta: selected ? 2 : 1),
        )
      ],
    ),
  );
}
