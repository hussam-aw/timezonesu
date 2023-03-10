import 'package:get/get.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/DataAccesslayer/Models/brand.dart';
import 'package:timezonesu/DataAccesslayer/Models/category.dart';
import 'package:timezonesu/DataAccesslayer/Models/featured_product.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/brand_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/category_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/featured_repo.dart';

class HomeController extends GetxController {
  var loadingCategories = false.obs;
  var loadingBrands = false.obs;
  var loadingProducts = false.obs;

  CategoriesRepo categoriesRepo = CategoriesRepo();
  List<Category> categories = [];

  BrandsRepo brandsRepo = BrandsRepo();
  List<Brand> brands = [];

  FeaturedRepo featuredRepo = FeaturedRepo();
  List<FeaturedProduct> featuredProducts = [];

  Future<void> getCategories() async {
    loadingCategories.value = true;
    categories = await categoriesRepo.myCategories();
    loadingCategories.value = false;
  }

  Future<void> getBrands() async {
    loadingBrands.value = true;
    brands = await brandsRepo.myBrands();
    loadingBrands.value = false;
  }

  Future<void> getFeaturedProducts() async {
    loadingProducts.value = true;
    featuredProducts = await featuredRepo.myFeaturedProducts();
    loadingProducts.value = false;
  }

  void fetchHomeData() async {
    getCategories();
    getBrands();
    getFeaturedProducts();
    update();
  }

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }

  void goToCategortyScreen(Category category) {
    Get.toNamed(
      AppRoutes.categoryScreen,
      arguments: {'category': category},
    );
  }
}
