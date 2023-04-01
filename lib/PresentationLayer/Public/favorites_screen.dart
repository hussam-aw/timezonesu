import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/favorites_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

import '../Widgets/Category/product_box.dart';
import '../Widgets/Public/bottom_navigation_bar.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});
  final FavouriteController favouriteController =
      Get.find<FavouriteController>();
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.lightprimary,
      bottomNavigationBar: const TZBottomNavigationBar(),
      appBar: tzAppBar(),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pageTitle('favouritesTitle'.tr),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: favouriteController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductBox(
                          product: favouriteController.products[index],
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
