import 'package:get/get.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/orders_repo.dart';

import '../../DataAccesslayer/Models/order.dart';

class OrderScreenController extends GetxController {
  Order? order;
  final OrdersRepo ordersRepo = OrdersRepo();

  OrderScreenController(this.order);

  Future<void> refreshOrder() async {
    order = await ordersRepo.getOrderByID(order!.id);
    print(order!.id);
    update();
  }
}
