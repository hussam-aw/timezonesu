import 'package:flutter/material.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
  });

  String categoryName;
  String categoryIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(categoryIcon),
          ),
          spacer(),
          Text(categoryName),
        ],
      ),
    );
  }
}
