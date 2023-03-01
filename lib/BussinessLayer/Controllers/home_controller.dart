import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/brand.dart';
import 'package:timezonesu/DataAccesslayer/Models/category.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/brand_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/category_repo.dart';

class HomeController extends GetxController {
  CategoriesRepo categoriesRepo = CategoriesRepo();
  List<Category> categories = [];

  BrandsRepo brandsRepo = BrandsRepo();
  List<Brand> brands = [];

  Future<void> getCategories() async {
    categories = await categoriesRepo.myCategories();
    print(categories);
    update();
  }

  Future<void> getBrands() async {
    brands = await brandsRepo.myBrands();
    print(brands);
  }

  @override
  void onInit() {
    getCategories();
    getBrands();
    super.onInit();
  }
}
