import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/search_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

import '../Widgets/Category/product_box.dart';
import '../Widgets/Public/page_title.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController searchTextController = TextEditingController();
  final seachController = Get.find<SearchController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.lightprimary,
      appBar: tzAppBar(),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: searchTextController,
                  decoration: profileInputsStyle.copyWith(
                    hintText: 'searchTitle'.tr,
                  ),
                  onChanged: (value) {
                    seachController.search(value);
                  },
                ),
                spacer(),
                Expanded(
                  child: Obx(
                    () => !seachController.searchLoading.value
                        ? seachController.filteredProducts.isNotEmpty
                            ? SizedBox(
                                child: ListView.builder(
                                  itemCount:
                                      seachController.filteredProducts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProductBox(
                                      product: seachController
                                          .filteredProducts[index],
                                      cartController: cartController,
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: Text(
                                  'noResultText'.tr,
                                  style: UITextStyle.boldMeduim,
                                ),
                              )
                        : Center(
                            child: loadingItem(true, size: 70),
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
