import 'package:flutter/cupertino.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/shimmers/base_shimmer.dart';

Widget homeCategoryShimmer() {
  return Column(
    children: [
      const Shimmerwidget.roundedrectangler(width: 85, height: 85),
      spacer(),
      const Shimmerwidget.roundedrectangler(width: 85, height: 10)
    ],
  );
}
