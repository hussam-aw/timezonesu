import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/orders_controller.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Cart/order_item.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/page_title.dart';

import '../../Constants/ui_colors.dart';
import '../Widgets/Public/timezome_appbar.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final OrdersController ordersController = Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      /* bottomNavigationBar: const TZBottomNavigationBar(), */
      backgroundColor: UIColors.white,
      appBar: tzAppBar(),
      body: GetBuilder(
          init: ordersController,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pageTitle("Orders", isBlue: true),
                  Flexible(
                    child: ordersController.loading.value
                        ? Center(
                            child: loadingItem(true, size: 100),
                          )
                        : RefreshIndicator(
                            onRefresh: () async =>
                                await ordersController.getOrders(),
                            child: ListView.builder(
                              itemCount: ordersController.orders.length,
                              itemBuilder: (BuildContext context, int index) {
                                return orderItem(
                                    ordersController.orders[index]);
                              },
                            ),
                          ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
