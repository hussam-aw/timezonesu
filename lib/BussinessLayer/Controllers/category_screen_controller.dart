import 'package:get/get.dart';

import '../../DataAccesslayer/Models/category.dart';
import '../../DataAccesslayer/Models/product.dart';
import '../../DataAccesslayer/Repositories/products_bycategory_repo.dart';

class CategoryScreenController extends GetxController {
  final Category category;

  ProductsByCategoryRepo productsByCategoryRepo = ProductsByCategoryRepo();
  List<Product> products = [];

  CategoryScreenController(this.category);

  Future<void> getCategoryProducts(int categoryId) async {
    products = await productsByCategoryRepo.products(categoryId);
    update();
  }

  @override
  void onInit() async {
    await getCategoryProducts(category.id);
    super.onInit();
  }
}
