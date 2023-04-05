import 'package:get/get.dart';

class OrderState {
  static String fromId(int id) {
    switch (id) {
      case 0:
        return 'receivedOrderStatus'.tr;
      case 1:
        return 'checkOrderStatus'.tr;
      case 2:
        return 'processOrderStatus'.tr;
      case 3:
        return 'deliveryOrderStatus'.tr;
      case 4:
        return 'deliveredOrderStatus'.tr;

      default:
        return "";
    }
  }
}
