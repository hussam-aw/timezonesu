import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/category_box.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Home/images_slider.dart';
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ImagesSlider(
                    height: 120,
                    images: const [
                      'assets/images/slider1.jpg',
                      'assets/images/slider2.png',
                      'assets/images/slider3.jpg',
                      'assets/images/slider4.jpg',
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                    color: UIColors.primary,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(45)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 25),
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
                            Container(
                              height: 112,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CategoryBox(
                                    categoryName:
                                        categories[index]['name'].toString(),
                                    categoryIcon:
                                        categories[index]['icon'].toString(),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 10);
                                },
                                itemCount: 5,
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
      ),
    );
  }
}
