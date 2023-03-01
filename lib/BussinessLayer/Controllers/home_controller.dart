import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Models/category.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/category_repo.dart';

class HomeController extends GetxController {
  CategoriesRepo categoriesRepo = CategoriesRepo();

  Future<List<Category>> getCategories() async {
    return await categoriesRepo.myCategories();
  }
}
