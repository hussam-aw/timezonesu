import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Helpers/box_client.dart';
import 'package:timezonesu/DataAccesslayer/Models/order.dart';
import 'package:timezonesu/DataAccesslayer/Repositories/orders_repo.dart';
import 'package:timezonesu/main.dart';

class OrdersController extends GetxController {
  BoxClient boxClient = BoxClient();
  List<Order> orders = [];
  var loading = false.obs;

  OrdersRepo repo = OrdersRepo();

  Future<void> getOrders() async {
    loading.value = true;

    if (MyApp.appUser != null) {
      orders = await repo.getOrders(MyApp.appUser!.id);
    } else {
      String email = await boxClient.getSavedMail();
      if (email != "") {
        orders = await repo.getOrdersByMail(email);
      }
    }
    update();
    loading.value = false;
  }

  @override
  void onInit() async {
    await getOrders();
    super.onInit();
  }
}
