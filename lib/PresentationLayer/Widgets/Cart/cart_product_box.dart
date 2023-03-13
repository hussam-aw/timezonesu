import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class CartProductBox extends StatelessWidget {
  const CartProductBox({
    super.key,
    required this.brandName,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.price,
  });

  final String brandName;
  final String productName;
  final String productImage;
  final String quantity;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      //height: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: UIColors.lightprimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 9,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: UIColors.white,
                      border: Border.all(
                        color: UIColors.lightGrey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //     '',
                      //   ),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: 10,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Casio',
                            style: UITextStyle.boldMeduim,
                          ),
                        ),
                        spacer(height: 4),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'wwrr88',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: UITextStyle.boldSmall.copyWith(
                              color: UIColors.lightGrey,
                            ),
                          ),
                        ),
                        spacer(height: 4),
                        Row(
                          children: [
                            Text(
                              'Qyt: ',
                              style: UITextStyle.boldSmall.copyWith(
                                color: UIColors.lightGrey,
                              ),
                            ),
                            Text(
                              '5',
                              style: UITextStyle.boldSmall.copyWith(
                                color: UIColors.lightGrey,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Price: ',
                              style: UITextStyle.boldSmall.copyWith(
                                color: UIColors.lightGrey,
                              ),
                            ),
                            Text(
                              '40.000',
                              style: UITextStyle.boldSmall.copyWith(
                                color: UIColors.lightGrey,
                              ),
                            ),
                          ],
                        ),
                        spacer(height: 4),
                        Row(
                          children: [
                            Text(
                              'Total: ',
                              style: UITextStyle.boldSmall.copyWith(
                                color: UIColors.lightGrey,
                              ),
                            ),
                            Text(
                              '200.000',
                              style: UITextStyle.boldSmall.copyWith(
                                color: UIColors.lightGrey,
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
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.edit_note,
                    color: UIColors.white,
                    size: 32,
                  ),
                ),
                spacer(height: 5),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.remove_circle,
                    color: UIColors.white,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
