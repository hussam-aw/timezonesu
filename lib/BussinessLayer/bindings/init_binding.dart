import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/app_language_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppLanguageController(), fenix: true);
  }
}
