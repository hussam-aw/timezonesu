import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class ProductBox extends StatelessWidget {
  ProductBox({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  String productName;
  String productImage;
  String productPrice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 150,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                productImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productName,
                style: UITextStyle.boldMeduim.copyWith(
                  color: UIColors.lightNormalText,
                ),
              ),
              const SizedBox(width: 25),
              Text(
                productPrice,
                style: UITextStyle.normalBody,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
