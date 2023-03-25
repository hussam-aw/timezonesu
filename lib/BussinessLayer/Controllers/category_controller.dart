import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/product.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/products_repo.dart';

import '../../DataAccesslayer/Models/category.dart';

class CategoryController extends GetxController {
  final Category category;

  ProductsRepo productsByCategoryRepo = ProductsRepo();
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
