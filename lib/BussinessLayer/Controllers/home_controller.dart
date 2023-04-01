import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/DataAccesslayer/Models/banner.dart';
import 'package:timezonesu/DataAccesslayer/Models/brand.dart';
import 'package:timezonesu/DataAccesslayer/Models/category.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/banner_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/brand_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/category_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/featured_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/products_repo.dart';

import '../../DataAccesslayer/Models/product.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  var loadingBanners = false.obs;
  var loadingCategories = false.obs;
  var loadingBrands = false.obs;
  var loadingFeaturedProducts = false.obs;
  var loadingBigDealProducts = false.obs;

  BannersRepo bannersRepo = BannersRepo();
  List<AppBanner> banners = [];

  CategoriesRepo categoriesRepo = CategoriesRepo();
  List<Category> categories = [];

  BrandsRepo brandsRepo = BrandsRepo();
  List<Brand> brands = [];

  FeaturedRepo featuredRepo = FeaturedRepo();
  List<Product> featuredProducts = [];

  ProductsRepo productsRepo = ProductsRepo();
  List<Product> bigDealProducts = [];

  var animationVal = 0.0.obs;
  late AnimationController arrowAnimation;

  Future<void> getBanners() async {
    loadingBanners.value = true;
    banners = await bannersRepo.myBanners();
    loadingBanners.value = false;
  }

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
    loadingFeaturedProducts.value = true;
    featuredProducts = await featuredRepo.myFeaturedProducts();
    loadingFeaturedProducts.value = false;
  }

  Future<void> getBigDealProducts() async {
    loadingBigDealProducts.value = true;
    bigDealProducts = await productsRepo.bigDealProducts();
    loadingBigDealProducts.value = false;
  }

  void fetchHomeData() async {
    getBanners();
    getCategories();
    getBrands();
    getFeaturedProducts();
    getBigDealProducts();
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

  void goToBrandScreen(Brand brand) {
    Get.toNamed(
      AppRoutes.brandScreen,
      arguments: {'brand': brand},
    );
  }

  void goToProductScreen(Product product) {
    Get.toNamed(
      AppRoutes.productScreen,
      arguments: [product],
    );
  }

  @override
  void onClose() {
    arrowAnimation.dispose();
    super.onClose();
  }
}
