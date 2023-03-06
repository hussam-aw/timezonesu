import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

class BrandIcon extends StatelessWidget {
  BrandIcon({super.key, this.brandImage});

  String? brandImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: 32.0,
      backgroundColor: UIColors.circleAvatarBackground,
      backgroundImage: NetworkImage(
        brandImage ?? '',
      ),
    );
  }
}
