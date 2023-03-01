import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
