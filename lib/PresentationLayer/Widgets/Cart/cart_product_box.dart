import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/DataAccesslayer/Models/cart_product.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class CartProductBox extends StatelessWidget {
  const CartProductBox(
      {super.key,
      required this.cartProduct,
      required this.index,
      required this.cartController});
  final CartController cartController;
  final CartProduct cartProduct;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: cartController,
      builder: (context) {
        return Container(
          width: Get.width,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: UIColors.lightprimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                            image: DecorationImage(
                                image: NetworkImage(
                                    cartProduct.product!.images[0]),
                                fit: BoxFit.cover)
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (cartProduct.product!.category != "")
                              Text(
                                cartProduct.product!.category,
                                style: UITextStyle.boldMeduim,
                              ),
                            spacer(height: 4),
                            Text(cartProduct.product!.name,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: UITextStyle.normalMeduim),
                            spacer(),
                            Row(
                              children: [
                                Text(
                                  'qtyTitle'.tr,
                                  style: UITextStyle.boldSmall.copyWith(
                                    color: UIColors.white.withOpacity(.8),
                                  ),
                                ),
                                Text(cartProduct.qty.toString(),
                                    style: UITextStyle.boldSmall),
                                const SizedBox(width: 10),
                                Text(
                                  'priceTitle'.tr,
                                  style: UITextStyle.boldSmall.copyWith(
                                    color: UIColors.white.withOpacity(.8),
                                  ),
                                ),
                                Text(cartProduct.product!.price,
                                    style: UITextStyle.boldSmall),
                              ],
                            ),
                            spacer(height: 4),
                            Row(
                              children: [
                                Text(
                                  'totalText'.tr,
                                  style: UITextStyle.boldSmall.copyWith(
                                    color: UIColors.white.withOpacity(.8),
                                  ),
                                ),
                                Text(
                                    (cartProduct.qty *
                                            num.parse(
                                                cartProduct.product!.price))
                                        .toString(),
                                    style: UITextStyle.boldSmall),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        cartController.showEditDialog(index, cartProduct.qty);
                      },
                      child: const Icon(
                        Icons.edit,
                        color: UIColors.white,
                        size: 32,
                      ),
                    ),
                    spacer(height: 5),
                    InkWell(
                      onTap: () async {
                        await cartController.removeCartItemQty(index);
                      },
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
      },
    );
  }
}
