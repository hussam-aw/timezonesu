import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/category_controller.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/DataAccesslayer/Models/category.dart';
import 'package:timezonesu/DataAccesslayer/Models/product.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Category/category_product_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/bottom_navigation_bar.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/transparent_header.dart';

import '../../Constants/ui_colors.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Category category = Get.arguments['category'];
    final categoryProducts = Get.arguments['categoryProducts'];
    return Scaffold(
      backgroundColor: UIColors.white,
      body: SafeArea(
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
                      height: 300,
                      width: Get.width,
                      child: Image.network(
                        category.image,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        category.name,
                        style: UITextStyle.boldHeading.copyWith(
                          color: UIColors.subTitle,
                        ),
                      ),
                    ),
                    GetBuilder<CategoryController>(builder: (context) {
                      return Container(
                        height: 360,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CategoryProductBox(
                              brandName: categoryProducts[index].brand,
                              productName: categoryProducts[index].name,
                              price: categoryProducts[index].price,
                              offer: categoryProducts[index].offer,
                              image: categoryProducts[index].images[0],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return spacer(height: 20);
                          },
                          itemCount: categoryProducts.length,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TZBottomNavigationBar(),
    );
  }
}
