import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/PresentationLayer/Widgets/shimmers/base_shimmer.dart';

Widget brandShimmer() {
  return const Shimmerwidget.roundedrectangler(
    width: 280,
    height: double.infinity,
    shapeBorder: RoundedRectangleBorder(borderRadius: raduis15),
  );
}
