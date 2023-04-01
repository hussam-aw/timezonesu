import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/favorites_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/home_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/notification_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/product_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/profile_controller.dart';
import 'package:timezonesu/BussinessLayer/Controllers/search_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.lazyPut(() => ProductController(), fenix: true);
    Get.put(CartController());
    Get.put(FavouriteController());
    Get.put(BackNotificationController());
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.put(SearchController());
  }
}
