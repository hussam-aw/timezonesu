import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/brand.dart';
import 'package:timezonesu/DataAccesslayer/Models/category.dart';
import 'package:timezonesu/DataAccesslayer/Models/featured_product.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/brand_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/category_repo.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/featured_repo.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  CategoriesRepo categoriesRepo = CategoriesRepo();
  List<Category> categories = [];

  BrandsRepo brandsRepo = BrandsRepo();
  List<Brand> brands = [];

  FeaturedRepo featuredRepo = FeaturedRepo();
  List<FeaturedProduct> featuredProducts = [];

  Future<void> getCategories() async {
    categories = await categoriesRepo.myCategories();
    print(categories);
  }

  Future<void> getBrands() async {
    brands = await brandsRepo.myBrands();
    print(brands);
  }

  Future<void> getFeaturedProducts() async {
    featuredProducts = await featuredRepo.myFeaturedProducts();
    print(featuredProducts);
  }

  void fetchHomeData() async {
    isLoading(true);
    await getCategories();
    await getBrands();
    await getFeaturedProducts();
    if (categories.isNotEmpty &&
        brands.isNotEmpty &&
        featuredProducts.isNotEmpty) {
      update();
      isLoading(false);
    }

    print(isLoading.value);
  }

  @override
  void onInit() {
    fetchHomeData();
    super.onInit();
  }
}
