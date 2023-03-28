import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/product_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/DataAccesslayer/Models/product.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/transparent_header.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final productController = Get.find<ProductController>();
  final CartController cartController = Get.find<CartController>();
  final Product product = Get.arguments['product'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UIColors.lightprimary,
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                            child: SizedBox(
                              height: 400,
                              width: Get.width,
                              child: Image.network(
                                product.images[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          TransparentHeader(
                            trailling: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_cart,
                                size: 30,
                                color: UIColors.activeIcon,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.brand.toUpperCase(),
                                      style: UITextStyle.boldHeading,
                                    ),
                                    spacer(height: 15),
                                    Text(
                                      product.name,
                                      style: UITextStyle.boldHeading.copyWith(
                                        color: UIColors.lightGrey,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80),
                                  child: Column(
                                    children: [
                                      Text(
                                        product.price,
                                        style: UITextStyle.boldMeduim.copyWith(
                                          color: UIColors.lightGrey,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      spacer(height: 7),
                                      Text(
                                        product.offer,
                                        style: UITextStyle.boldHeading.copyWith(
                                          color: UIColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            spacer(),
                            Text(
                              product.description,
                              style: UITextStyle.normalBody.copyWith(
                                color: UIColors.lightNormalText,
                              ),
                            ),
                            const Divider(color: UIColors.lightGrey),
                            spacer(),
                            Row(
                              children: [
                                Text(
                                  'brandTitle'.tr,
                                  style: UITextStyle.boldBody,
                                ),
                                Text(
                                  product.brand,
                                  style: UITextStyle.normalBody.copyWith(
                                    color: UIColors.lightGrey,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Text(
                                  'rNumberTitle'.tr,
                                  style: UITextStyle.boldBody,
                                ),
                                Text(
                                  product.name,
                                  style: UITextStyle.normalBody.copyWith(
                                    color: UIColors.lightGrey,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                // Text(
                                //   'genderTitle'.tr,
                                //   style: UITextStyle.boldBody,
                                // ),
                                // Text(
                                //   productController
                                //       .getGender(int.parse(product.gender)),
                                //   style: UITextStyle.normalBody.copyWith(
                                //     color: UIColors.lightGrey,
                                //   ),
                                // ),
                              ],
                            ),
                            spacer(height: 10),
                            Row(
                              children: const [
                                /* const Text(
                                  'Movement: ',
                                  style: UITextStyle.boldMeduim,
                                ),
                                Text(
                                  product.movement,
                                  style: UITextStyle.normalBody.copyWith(
                                    color: UIColors.lightGrey,
                                  ),
                                ), */
                                SizedBox(width: 14),
                                /* const Text(
                                  'Case size: ',
                                  style: UITextStyle.boldMeduim,
                                ),
                                Text(
                                  product.caseSize,
                                  style: UITextStyle.normalBody.copyWith(
                                    color: UIColors.lightGrey,
                                  ),
                                ), */
                              ],
                            ),
                            spacer(),
                            const Divider(color: UIColors.lightGrey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  child: ElevatedButton(
                    onPressed: () async {
                      cartController.addToCart(product);
                    },
                    style: acceptButtonStyle,
                    child: Text(
                      'addToCartButton'.tr,
                      style: UITextStyle.normalHeading,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
