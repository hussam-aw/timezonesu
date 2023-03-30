import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/brand_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Category/product_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/shimmers/category_product_shimmer.dart';

class BrandScreen extends StatelessWidget {
  BrandScreen({super.key});
  final BrandController brandController = Get.put(
    BrandController(Get.arguments['brand']),
  );
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.lightprimary,
      body: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 350,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: raduis20bottom,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(brandController.brand.image),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => brandController.isProductsLoading.value
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 8,
                          (context, index) {
                            return categoryProducrShimmer();
                          },
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: brandController.products.length,
                          (context, index) {
                            return ProductBox(
                              product: brandController.products[index],
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
    );
  }
}
