import 'package:get/get.dart';

import '../../DataAccesslayer/Models/order.dart';

class OrderScreenController extends GetxController {
  final Order order;

  OrderScreenController(this.order);

  Future<void> refreshOrder() async {
    //TODO ALI : get order info by id (Ask Ruba for API LINK)
    //order = await .....
    // update();
  }
}
