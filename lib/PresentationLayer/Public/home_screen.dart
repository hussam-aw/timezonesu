import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timezonesu/BussinessLayer/Controllers/category_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/home_controller.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Public/product_screen.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/advertisement_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/brand_icon.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/category_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/empty_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/custom_slider.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/product_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/bottom_navigation_bar.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/drawer.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.find<HomeController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: UIColors.mainBackground,
        appBar: tzAppBar(
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
        drawer: const TzDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomSlider(
                      height: 120,
                      widgets: [
                        AdvertisementBox(
                          title: 'Flash Sales',
                          subtitle: 'Under 500',
                          image: 'assets/images/slider1.png',
                        ),
                        AdvertisementBox(
                          title: 'Flash Sales',
                          subtitle: 'Under 500',
                          image: 'assets/images/slider2.png',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(left: 25),
                    decoration: const BoxDecoration(
                      color: UIColors.primary,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(45)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18),
                                child: Text(
                                  'Categories',
                                  style: UITextStyle.boldHeading.copyWith(
                                    color: UIColors.lightNormalText,
                                  ),
                                ),
                              ),
                              homeController.isLoading.value
                                  ? Shimmer.fromColors(
                                      baseColor: UIColors.containerBackground,
                                      highlightColor: UIColors.mainBackground,
                                      enabled: homeController.isLoading.value,
                                      child: SizedBox(
                                        height: 112,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return EmptyBox(
                                                width: 85, height: 110);
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(width: 20);
                                          },
                                          itemCount: 7,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 112,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return CategoryBox(
                                            onTap: () async {
                                              await categoryController
                                                  .getCategoryProducts(
                                                      homeController
                                                          .categories[index]
                                                          .id);
                                              print(
                                                  categoryController.products);
                                              Get.toNamed(
                                                AppRoutes.categoryScreen,
                                                arguments: {
                                                  'category': homeController
                                                      .categories[index],
                                                  'categoryProducts':
                                                      categoryController
                                                          .products
                                                },
                                              );
                                            },
                                            categoryName: homeController
                                                .categories[index].name,
                                            categoryIcon: homeController
                                                .categories[index].image,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(width: 20);
                                        },
                                        itemCount:
                                            homeController.categories.length,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18),
                                child: Text(
                                  'Brands',
                                  style: UITextStyle.boldHeading.copyWith(
                                    color: UIColors.lightNormalText,
                                  ),
                                ),
                              ),
                              homeController.isLoading.value
                                  ? Shimmer.fromColors(
                                      baseColor: UIColors.containerBackground,
                                      highlightColor: UIColors.mainBackground,
                                      enabled: homeController.isLoading.value,
                                      child: SizedBox(
                                        height: 62,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return BrandIcon();
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(width: 18);
                                          },
                                          itemCount: 7,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 62,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return BrandIcon(
                                            brandImage: homeController
                                                .brands[index].image,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(width: 18);
                                        },
                                        itemCount: homeController.brands.length,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18),
                                child: Text(
                                  'Featured Products',
                                  style: UITextStyle.boldHeading.copyWith(
                                    color: UIColors.lightNormalText,
                                  ),
                                ),
                              ),
                              homeController.isLoading.value
                                  ? Shimmer.fromColors(
                                      baseColor: UIColors.containerBackground,
                                      highlightColor: UIColors.mainBackground,
                                      enabled: homeController.isLoading.value,
                                      child: SizedBox(
                                        height: 200,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return EmptyBox(
                                                width: 150, height: 110);
                                          },
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(width: 20);
                                          },
                                          itemCount: 7,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 200,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return ProductBox(
                                            onTap: () => Get.toNamed(
                                                AppRoutes.productScreen,
                                                arguments: {
                                                  'product': homeController
                                                      .featuredProducts[index]
                                                }),
                                            productBrand: homeController
                                                .featuredProducts[index].brand,
                                            productName: homeController
                                                .featuredProducts[index].name,
                                            productImage: homeController
                                                .featuredProducts[index]
                                                .images[0],
                                            productPrice: homeController
                                                .featuredProducts[index].price,
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(width: 18);
                                        },
                                        itemCount: homeController
                                            .featuredProducts.length,
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
        ),
        bottomNavigationBar: const TZBottomNavigationBar(),
      ),
    );
  }
}
