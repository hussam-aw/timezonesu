import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/order_screen_controller.dart';
import 'package:timezonesu/BussinessLayer/Helpers/order_state.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/DataAccesslayer/Models/order.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});
  final Order order = Get.arguments[0];
  final OrderScreenController controller =
      Get.put(OrderScreenController(Get.arguments[0]));
  @override
  Widget build(BuildContext context) {
    List<Widget> buildDetails() {
      List<Widget> temp = [];
      for (var detail in controller.order!.orderDetails) {
        temp.add(ListTile(
          isThreeLine: true,
          dense: true,
          leading: CircleAvatar(
            backgroundColor: UIColors.white,
            radius: 15,
            child: Text((controller.order!.orderDetails.indexOf(detail) + 1)
                .toString()),
          ),
          title: Text(detail.product, style: UITextStyle.boldBody),
          subtitle: RichText(
              text: TextSpan(children: [
            TextSpan(text: 'qtyTitle'.tr, style: UITextStyle.boldSmall),
            TextSpan(
                text: detail.quantity.toString(),
                style: UITextStyle.normalSmall),
            TextSpan(
                text: '- ' + 'individualText'.tr, style: UITextStyle.boldSmall),
            TextSpan(
                text: detail.price.toString(), style: UITextStyle.normalSmall),
            TextSpan(text: '- ' + 'totalText'.tr, style: UITextStyle.boldSmall),
            TextSpan(
                text: detail.totalPrice.toString(),
                style: UITextStyle.normalSmall),
          ])),
        ));
      }
      return temp;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      /* bottomNavigationBar: const TZBottomNavigationBar(), */
      backgroundColor: UIColors.lightprimary,
      appBar: tzAppBar(),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GetBuilder(
                init: controller,
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pageTitle(
                          'orderNumberTitle'.tr + "${controller.order!.id}"),
                      RefreshIndicator(
                        onRefresh: () async => await controller.refreshOrder(),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacer(height: 30),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'orderStatusTitle'.tr,
                                    style: UITextStyle.boldMeduim),
                                TextSpan(
                                    text: OrderState.fromId(
                                        controller.order!.status),
                                    style: UITextStyle.normalMeduim),
                              ])),
                              spacer(height: 40),
                              Text(
                                'orderDetailsTitle'.tr,
                                style: UITextStyle.boldMeduim,
                              ),
                              spacer(),
                              Column(
                                children: buildDetails(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
