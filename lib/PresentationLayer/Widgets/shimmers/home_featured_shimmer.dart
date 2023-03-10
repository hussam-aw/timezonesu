import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/shimmers/base_shimmer.dart';

Widget homeFeaturedShimmer() {
  return SizedBox(
    width: 150,
    child: Column(
      children: [
        const Expanded(
          flex: 5,
          child: Shimmerwidget.roundedrectangler(
            width: 150,
            height: 110,
          ),
        ),
        spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Shimmerwidget.rectangler(
                    height: 15,
                    width: 60,
                  ),
                  Shimmerwidget.rectangler(
                    height: 15,
                    width: 35,
                  ),
                ],
              ),
              spacer(height: 8),
              const Shimmerwidget.rectangler(
                height: 15,
                width: 90,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
