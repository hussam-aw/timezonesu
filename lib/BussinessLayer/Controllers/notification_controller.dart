import 'package:get/get.dart';

import '../../Constants/get_routes.dart';
import '../../DataAccessLayer/Models/notification.dart';
import '../../DataAccessLayer/Models/product.dart';
import '../../DataAccessLayer/Repositories/notification_repo.dart';
import '../../main.dart';

class BackNotificationController extends GetxController {
  late List<UserNotification> userNotifications = [];
  var backNotificationRepo = NotificationRepo();
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getBackNotifications();
    super.onInit();
  }

  void gotoPayload(UserNotification userNotification) {
    if (userNotification.type == 'newProduct') {
      Product product =
          Product.fromMap(userNotification.data as Map<String, dynamic>);
      Get.toNamed(AppRoutes.productScreen, arguments: [product]);
    }
  }

  Future<void> getBackNotifications() async {
    if (MyApp.appUser != null) {
      isLoading.value = true;
      userNotifications =
          await backNotificationRepo.getNotifications(MyApp.appUser!.id);
      update();
      isLoading.value = false;
    }
  }
}
