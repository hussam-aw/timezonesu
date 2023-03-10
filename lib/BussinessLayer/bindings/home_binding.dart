import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/category_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/home_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/product_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.lazyPut(() => ProductController(), fenix: true);
  }
}
