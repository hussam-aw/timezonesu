import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class CategoryProductBox extends StatelessWidget {
  const CategoryProductBox({
    super.key,
    required this.brandName,
    required this.productName,
    required this.price,
    required this.offer,
    required this.image,
  });

  final String brandName;
  final String productName;
  final String price;
  final String offer;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        height: 100,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: UIColors.primary,
          borderRadius: raduis20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: UIColors.white,
                        borderRadius: raduis10,
                        image: DecorationImage(
                          image: NetworkImage(
                            image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, top: 5),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              brandName,
                              style: UITextStyle.boldHeading,
                            ),
                          ),
                          spacer(height: 4),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              productName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: UITextStyle.normalMeduim
                                  .apply(fontSizeFactor: .8),
                            ),
                          ),
                          spacer(),
                          Row(
                            children: [
                              Text(
                                price,
                                style: UITextStyle.boldMeduim.copyWith(
                                  color: num.parse(offer) != 0
                                      ? UIColors.lightGrey
                                      : UIColors.white,
                                  decoration: num.parse(offer) != 0
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              if (num.parse(offer) != 0)
                                const SizedBox(width: 10),
                              if (num.parse(offer) != 0)
                                Text(
                                  offer,
                                  style: UITextStyle.boldMeduim.copyWith(
                                    color: UIColors.white,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart_sharp,
                  color: UIColors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
