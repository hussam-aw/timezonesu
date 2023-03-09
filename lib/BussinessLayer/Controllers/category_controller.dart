import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/product.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/products_bycategory_repo.dart';

class CategoryController extends GetxController {
  ProductsByCategoryRepo productsByCategoryRepo = ProductsByCategoryRepo();
  List<Product> products = [];

  Future<void> getCategoryProducts(int categoryId) async {
    products = await productsByCategoryRepo.products(categoryId);
  }
}
