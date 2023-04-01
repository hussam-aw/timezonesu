import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/shimmers/base_shimmer.dart';

Widget categoryProducrShimmer() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: Get.width,
      height: 100,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: UIColors.primary,
        borderRadius: raduis20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Shimmerwidget.roundedrectangler(
                    width: Get.width,
                    height: 100,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Shimmerwidget.rectangler(width: 80, height: 20),
                        spacer(height: 4),
                        const Shimmerwidget.rectangler(width: 140, height: 15),
                        spacer(),
                        const Shimmerwidget.rectangler(width: 100, height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    ),
  );
}
