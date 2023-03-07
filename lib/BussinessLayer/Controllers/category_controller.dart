import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/product.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/ProductsByCategoryRepo.dart';

class CategoryController extends GetxController {
  ProductsByCategoryRepo productsByCategoryRepo = ProductsByCategoryRepo();
  List<Product> products = [];

  void getCategoryProducts(int categoryId) async {
    products = await productsByCategoryRepo.products(categoryId);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
