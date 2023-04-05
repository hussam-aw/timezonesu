import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Helpers/order_state.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/DataAccesslayer/Models/order.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

import '../../../Constants/ui_text_style.dart';

Widget orderItem(Order order) {
  return InkWell(
    onTap: () {
      Get.toNamed(AppRoutes.orderScreen, arguments: [order]);
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration:
          const BoxDecoration(color: UIColors.primary, borderRadius: raduis10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: UIColors.lightprimary,
              child: Text(
                order.id.toString(),
                style: UITextStyle.boldHeading,
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'orderStatusTitle'.tr,
                        style: UITextStyle.boldBody,
                      ),
                      TextSpan(
                        text: OrderState.fromId(order.status),
                        style: UITextStyle.normalBody,
                      )
                    ]),
                  ),
                  spacer(),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'orderValueTitle'.tr,
                        style: UITextStyle.boldBody,
                      ),
                      TextSpan(
                        text: order.totalPrice.toString(),
                        style: UITextStyle.normalBody,
                      )
                    ]),
                  ),
                ],
              ))
        ],
      ),
    ),
  );
}
