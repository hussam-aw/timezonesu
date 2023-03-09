import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Cart/cart_product_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UIColors.primary,
      appBar: tzAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: UIColors.activeIcon,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
              color: UIColors.activeIcon,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: UIColors.activeIcon,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                        child: Text(
                          'Shopping Cart',
                          style: UITextStyle.boldHeading,
                        ),
                      ),
                      SizedBox(
                        height: 450,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return const CartProductBox(
                              brandName: '',
                              productName: '',
                              productImage: '',
                              quantity: '',
                              price: '',
                            );
                          },
                          separatorBuilder: (context, index) {
                            return spacer(height: 20);
                          },
                          itemCount: 8,
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
                                  'Discount:',
                                  style: UITextStyle.normalMeduim.copyWith(
                                    color: UIColors.specialText,
                                  ),
                                ),
                                const SizedBox(width: 35),
                                Text(
                                  '200.000 sp',
                                  style: UITextStyle.normalMeduim.copyWith(
                                    color: UIColors.specialText,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            spacer(),
                            Row(
                              children: const [
                                Text(
                                  'Net Value:',
                                  style: UITextStyle.normalMeduim,
                                ),
                                SizedBox(width: 30),
                                Text(
                                  '200.000 sp',
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
            ),
          ),
        ),
      ),
    );
  }
}
