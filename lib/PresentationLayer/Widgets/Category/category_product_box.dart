import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class CategoryProductBox extends StatelessWidget {
  CategoryProductBox({
    super.key,
    required this.brandName,
    required this.productName,
    required this.price,
    required this.offer,
    required this.image,
  });

  String brandName;
  String productName;
  String price;
  String offer;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      //height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: UIColors.lightprimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: UIColors.white,
                  border: Border.all(
                    color: UIColors.lightGrey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 122,
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
                        style: UITextStyle.boldMeduim,
                      ),
                    ),
                    spacer(height: 4),
                    Row(
                      children: [
                        Text(
                          price,
                          style: UITextStyle.boldMeduim.copyWith(
                            color: UIColors.lightGrey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 10),
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
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_shopping_cart_sharp,
              color: UIColors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
