import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/category_controller.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/PresentationLayer/Widgets/shimmers/category_product_shimmer.dart';

import '../Widgets/Category/product_box.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final CategoryController categoryController = Get.put(
    CategoryController(Get.arguments['category']),
  );
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      image: NetworkImage(categoryController.category.image),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => categoryController.isProductsLoading.value
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
                        childCount: categoryController.products.length,
                        (context, index) {
                          return ProductBox(
                            product: categoryController.products[index],
                            cartController: cartController,
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );

    /*  Scaffold(
      backgroundColor: UIColors.white,
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              Expanded(
                flex: 9,
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
                              controller.category.image,
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
                    Expanded(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    controller.category.name,
                                    style: UITextStyle.boldHeading.copyWith(
                                      color: UIColors.subTitle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return CategoryProductBox(
                                        brandName:
                                            controller.products[index].brand,
                                        productName:
                                            controller.products[index].name,
                                        price: controller.products[index].price,
                                        offer: controller.products[index].offer,
                                        image: controller
                                            .products[index].images[0],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return spacer(height: 20);
                                    },
                                    itemCount: controller.products.length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: UIColors.white,
                                  blurRadius: 25.0,
                                  spreadRadius: 25,
                                  offset: Offset(0, 400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const TZBottomNavigationBar(),
    );
   */
  }
}
