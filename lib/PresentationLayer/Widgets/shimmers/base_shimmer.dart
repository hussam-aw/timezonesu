import 'package:flutter/material.dart';
/* import 'package:realestateapp/constants/CustomStyles.dart'; */
import 'package:shimmer/shimmer.dart';

import '../../../Constants/ui_styles.dart';

class Shimmerwidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  const Shimmerwidget.circular(
      {Key? key,
      required this.width,
      required this.height,
      this.shapeBorder = const CircleBorder()})
      : super(key: key);
  const Shimmerwidget.rectangler(
      {Key? key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder = const RoundedRectangleBorder()})
      : super(key: key);
  const Shimmerwidget.roundedrectangler(
      {Key? key,
      required this.width,
      required this.height,
      this.shapeBorder = const RoundedRectangleBorder(borderRadius: raduis20)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 184, 184, 184),
        highlightColor: const Color.fromARGB(255, 231, 231, 231),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder,
            color: const Color.fromARGB(255, 151, 151, 151),
          ),
        ));
  }
}
