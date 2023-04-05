import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:timezonesu/Constants/api_links.dart';

import '../../DataAccesslayer/Models/product.dart';
import '../../DataAccesslayer/Repositories/products_repo.dart';

class SearchController extends GetxController {
  var repo = ProductsRepo();
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  var searchLoading = false.obs;

  void search(String searchText) async {
    if (searchText.isNotEmpty) {
      searchLoading.value = true;
      filteredProducts = allProducts
          .where((product) =>
              product.name.toLowerCase() == searchText ||
              product.category.toLowerCase() == searchText ||
              product.brand.toLowerCase() == searchText)
          .toList();

      print(filteredProducts);
      searchLoading.value = false;
    } else {
      filteredProducts.clear();
    }
    update();
  }

  @override
  void onInit() async {
    allProducts = await repo.getProducts();
    super.onInit();
  }

  @override
  void onClose() {
    filteredProducts.clear();
    super.onClose();
  }
}
