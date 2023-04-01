import 'package:get/state_manager.dart';

import '../../DataAccesslayer/Models/product.dart';
import '../../DataAccesslayer/Repositories/products_repo.dart';

class SearchController extends GetxController {
  var repo = ProductsRepo();
  List<Product> allProducts = [];

  @override
  void onInit() async {
    allProducts = await repo.getProducts();
    super.onInit();
  }
}
