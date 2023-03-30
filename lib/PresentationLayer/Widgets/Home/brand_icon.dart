import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

class BrandIcon extends StatelessWidget {
  const BrandIcon({
    super.key,
    required this.brandImage,
    required this.onTap,
  });

  final String? brandImage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 60,
          height: 65,
          decoration: BoxDecoration(
            color: UIColors.circleAvatarBackground,
            image: brandImage != null
                ? DecorationImage(
                    image: NetworkImage(
                      brandImage!,
                    ),
                    fit: BoxFit.fill)
                : null,
          ),
        ),
      ),
    );
  }
}
