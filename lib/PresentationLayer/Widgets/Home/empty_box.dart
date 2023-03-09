import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class EmptyBox extends StatelessWidget {
const  EmptyBox({super.key, required this.width, required this.height});

  final double width;
 final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: UIColors.white,
              ),
            ),
          ),
          spacer(height: 7),
          Expanded(
            flex: 1,
            child: Container(
              color: UIColors.containerBackground,
            ),
          ),
        ],
      ),
    );
  }
}
// 85
// 110