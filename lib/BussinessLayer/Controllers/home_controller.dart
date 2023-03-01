import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/category.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/category_repo.dart';

class HomeController extends GetxController {
  CategoriesRepo categoriesRepo = CategoriesRepo();
  List<Category> categories = [];

  Future<void> getCategories() async {
    categories = await categoriesRepo.myCategories();
    print(categories);
    update();
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
