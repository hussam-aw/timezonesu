import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/home_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Category/product_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

import '../Widgets/Public/page_title.dart';

class BigDealsScreen extends StatelessWidget {
  BigDealsScreen({super.key});

  final homeController = Get.find<HomeController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.lightprimary,
      appBar: tzAppBar(),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pageTitle('${'topSalesTitle'.tr}:'),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: homeController.bigDealProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductBox(
                          product: homeController.bigDealProducts[index],
                          cartController: cartController,
                        );
                      },
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
