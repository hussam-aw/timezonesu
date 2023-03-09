import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.productBrand,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.onTap,
  });

  final String productBrand;
  final String productName;
  final String productImage;
  final String productPrice;
 final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: UIColors.containerBackground,
                      image: DecorationImage(
                        image: NetworkImage(
                          productImage,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productBrand,
                        style: UITextStyle.boldMeduim.copyWith(
                          color: UIColors.lightNormalText,
                        ),
                      ),
                      Text(
                        productPrice,
                        style: UITextStyle.normalBody,
                      ),
                    ],
                  ),
                  spacer(height: 8),
                  Text(
                    productName,
                    style: UITextStyle.boldBody,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
