import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
    required this.onTap,
  });

  final String categoryName;
 final String categoryIcon;
 final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 85,
        height: 110,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: UIColors.containerBackground,
                    image: DecorationImage(
                      image: NetworkImage(
                        categoryIcon,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            spacer(height: 7),
            Expanded(
              flex: 1,
              child: Text(
                categoryName,
                style: UITextStyle.boldSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
