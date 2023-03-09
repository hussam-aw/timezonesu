import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class AdvertisementBox extends StatelessWidget {
  const AdvertisementBox({super.key, this.title, this.subtitle, this.image});

  final String? title;
  final String? subtitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image.toString(),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 145),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toString().toUpperCase(),
              style: UITextStyle.boldMeduim,
            ),
            spacer(height: 6),
            Text(
              subtitle.toString(),
              style: UITextStyle.boldMeduim,
            )
          ],
        ),
      ),
    );
  }
}

// ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child: Image.asset(
//         image.toString(),
//         width: 280,
//         fit: BoxFit.cover,
//       ),
//     );