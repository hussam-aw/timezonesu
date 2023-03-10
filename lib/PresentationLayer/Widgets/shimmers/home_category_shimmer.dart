import 'package:flutter/cupertino.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/shimmers/base_shimmer.dart';

Widget homeCategoryShimmer() {
  return SizedBox(
    height: 112,
    child: Column(
      children: [
        const Expanded(
          flex: 4,
          child: Shimmerwidget.roundedrectangler(
            width: 85,
            height: 88,
          ),
        ),
        spacer(),
        const Expanded(
          flex: 1,
          child: Shimmerwidget.roundedrectangler(
            width: 85,
            height: 24,
          ),
        )
      ],
    ),
  );
}
