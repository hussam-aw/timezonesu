import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/notification_controller.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/bottom_navigation_bar.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/notification_item.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

import '../../Constants/ui_colors.dart';
import '../Widgets/Public/page_title.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});
  final BackNotificationController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.lightprimary,
      appBar: tzAppBar(),
      bottomNavigationBar: const TZBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageTitle("notificationsItem".tr),
            Flexible(
              child: GetBuilder(
                  init: controller,
                  builder: (context) {
                    return RefreshIndicator(
                      onRefresh: () async => controller.getBackNotifications(),
                      child: controller.userNotifications.isEmpty
                          ? SizedBox(
                              height: Get.height / 2,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  spacer(height: 100),
                                  Text(
                                    "no_noti".tr,
                                    style: UITextStyle.normalMeduim,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.userNotifications.length,
                              itemBuilder: (BuildContext context, int index) {
                                return NotificationItem(
                                    userNotification:
                                        controller.userNotifications[index]);
                              },
                            ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
