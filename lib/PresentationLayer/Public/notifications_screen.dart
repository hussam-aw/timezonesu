import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/notification_controller.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/bottom_navigation_bar.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

import '../Widgets/Public/page_title.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});
  final BackNotificationController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: tzAppBar(),
      bottomNavigationBar: const TZBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            pageTitle("Shopping Cart"),
            Flexible(
              child: GetBuilder(
                  init: controller,
                  builder: (context) {
                    return RefreshIndicator(
                      onRefresh: () async => controller.getBackNotifications(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.userNotifications.length,
                        itemBuilder: (BuildContext context, int index) {
                          return const SizedBox();
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
