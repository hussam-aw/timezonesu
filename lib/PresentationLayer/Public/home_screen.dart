import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/home_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/advertisement_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/category_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/custom_slider.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/product_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/bottom_navigation_bar.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/drawer.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

List<Map<String, String>> categories = [
  {'name': 'Watches', 'icon': 'assets/images/category1.png'},
  {'name': 'Accessories', 'icon': 'assets/images/category2.png'},
  {'name': 'Calculators', 'icon': 'assets/images/category3.png'},
  {'name': 'Musical Instruments', 'icon': 'assets/images/category4.png'},
  {'name': 'Women', 'icon': 'assets/images/category5.png'},
];

List<String> brands = [
  'assets/images/brand1.png',
  'assets/images/brand2.png',
  'assets/images/brand3.png',
  'assets/images/brand4.png',
  'assets/images/brand5.png',
  'assets/images/brand6.png',
];

List<Map<String, String>> featuredProducts = [
  {'name': 'Casio', 'price': '480', 'image': 'assets/images/product1.png'},
  {'name': 'Casio', 'price': '480', 'image': 'assets/images/product2.png'},
  {'name': 'Casio', 'price': '480', 'image': 'assets/images/product3.png'},
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
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
            child: GetBuilder(
              init: Get.find<HomeController>(),
              builder: (controller) => Column(
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
                              SizedBox(
                                height: 112,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CategoryBox(
                                      categoryName:
                                          controller.categories[index].name,
                                      categoryIcon:
                                          controller.categories[index].image,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 20);
                                  },
                                  itemCount: controller.categories.length,
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
                              SizedBox(
                                height: 62,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CircleAvatar(
                                      minRadius: 32.0,
                                      backgroundImage: NetworkImage(
                                        controller.brands[index].image,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 18);
                                  },
                                  itemCount: controller.brands.length,
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
                              SizedBox(
                                height: 160,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return ProductBox(
                                      productName: featuredProducts[index]
                                              ['name']
                                          .toString(),
                                      productImage: featuredProducts[index]
                                              ['image']
                                          .toString(),
                                      productPrice: featuredProducts[index]
                                              ['price']
                                          .toString(),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 18);
                                  },
                                  itemCount: featuredProducts.length,
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
