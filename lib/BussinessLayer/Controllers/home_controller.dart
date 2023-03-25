import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/DataAccesslayer/Models/brand.dart';
import 'package:timezonesu/DataAccesslayer/Models/category.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/brand_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/category_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/featured_repo.dart';

import '../../DataAccesslayer/Models/product.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  var loadingCategories = false.obs;
  var loadingBrands = false.obs;
  var loadingProducts = false.obs;

  CategoriesRepo categoriesRepo = CategoriesRepo();
  List<Category> categories = [];

  BrandsRepo brandsRepo = BrandsRepo();
  List<Brand> brands = [];

  FeaturedRepo featuredRepo = FeaturedRepo();
  List<Product> featuredProducts = [];

  var animationVal = 0.0.obs;
  late AnimationController arrowAnimation;
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
    arrowAnimation =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    update();
    fetchHomeData();
    super.onInit();
  }

  @override
  void onReady() {
    arrowAnimation.repeat(reverse: true);
    arrowAnimation.addListener(() {
      animationVal.value = arrowAnimation.value;
    });

    super.onReady();
  }

  void goToCategortyScreen(Category category) {
    Get.toNamed(
      AppRoutes.categoryScreen,
      arguments: {'category': category},
    );
  }

  void goToProductScreen(Product product) {
    Get.toNamed(
      AppRoutes.productScreen,
      arguments: {'product': product},
    );
  }

  @override
  void onClose() {
    arrowAnimation.dispose();
    super.onClose();
  }
}
