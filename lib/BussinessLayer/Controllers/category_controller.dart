import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/product.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/products_bycategory_repo.dart';

import '../../DataAccesslayer/Models/category.dart';

class CategoryController extends GetxController {
  final Category category;

  ProductsByCategoryRepo productsByCategoryRepo = ProductsByCategoryRepo();
  List<Product> products = [];

  var isProductsLoading = false.obs;

  CategoryController(this.category);

  Future<void> getCategoryProducts(int categoryId) async {
    isProductsLoading.value = true;
    products = await productsByCategoryRepo.products(categoryId);
    isProductsLoading.value = false;
  }

  @override
  void onInit() async {
    await getCategoryProducts(category.id);
    super.onInit();
  }
}
