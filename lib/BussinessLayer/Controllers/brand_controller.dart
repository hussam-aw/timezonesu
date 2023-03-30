import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/brand.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/products_repo.dart';

import '../../DataAccesslayer/Models/product.dart';

class BrandController extends GetxController {
  final Brand brand;

  ProductsRepo productsRepo = ProductsRepo();
  List<Product> products = [];

  var isProductsLoading = false.obs;

  BrandController(this.brand);

  Future<void> getBrandProducts(int brandId) async {
    isProductsLoading.value = true;
    products = await productsRepo.brandProducts(brandId);
    isProductsLoading.value = false;
  }

  @override
  void onInit() async {
    await getBrandProducts(brand.id);
    super.onInit();
  }
}
