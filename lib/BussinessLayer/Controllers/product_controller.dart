import 'package:get/get.dart';

class ProductController extends GetxController {
  String getGender(int gender) {
    if (gender == 1) return 'Woman';
    return 'Men';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
