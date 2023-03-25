import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Cart/cart_product_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/bottom_navigation_bar.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({super.key});
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TZBottomNavigationBar(),
      backgroundColor: UIColors.primary,
      appBar: tzAppBar(),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GetBuilder(
                init: cartController,
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            pageTitle("Shopping Cart"),
                            Expanded(
                              child: SizedBox(
                                height: 450,
                                child: ListView.builder(
                                  itemCount: cartController.cartProducts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CartProductBox(
                                      cartProduct:
                                          cartController.cartProducts[index],
                                      index: index,
                                      cartController: cartController,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Total :',
                                        style:
                                            UITextStyle.normalMeduim.copyWith(
                                          color: UIColors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 35),
                                      Text(
                                        cartController.totalValue.toString(),
                                        style:
                                            UITextStyle.normalMeduim.copyWith(
                                          color: UIColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        'Discount:',
                                        style:
                                            UITextStyle.normalMeduim.copyWith(
                                          color: UIColors.specialText,
                                        ),
                                      ),
                                      const SizedBox(width: 35),
                                      Text(
                                        cartController.discount.toString(),
                                        style:
                                            UITextStyle.normalMeduim.copyWith(
                                          color: UIColors.specialText,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  spacer(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Net Value:',
                                        style: UITextStyle.normalMeduim,
                                      ),
                                      const SizedBox(width: 30),
                                      Text(
                                        cartController.netValue.toString(),
                                        style: UITextStyle.normalMeduim,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () async {},
                            style: normalButtonStyle,
                            child: Text(
                              'Check Out',
                              style: UITextStyle.boldMeduim.copyWith(
                                color: UIColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
