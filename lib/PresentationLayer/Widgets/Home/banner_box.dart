import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/app_language_controller.dart';
import 'package:timezonesu/BussinessLayer/Helpers/color_extension.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/DataAccesslayer/Models/banner.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class BannerBox extends StatelessWidget {
  BannerBox({super.key, required this.banner});

  final AppBanner banner;
  final appLanguageController = Get.find<AppLanguageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: raduis15,
        color: banner.type == "dynamic"
            ? HexColor(banner.backgroundColor!)
            : UIColors.darkGrey,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: banner.type == "dynamic"
              ? NetworkImage(
                  banner.dynamicImage!,
                )
              : NetworkImage(banner.staticImage!) as ImageProvider,
        ),
      ),
      child: banner.type == "dynamic"
          ? Padding(
              padding: const EdgeInsets.only(top: 20, left: 145),
              child: Column(
                crossAxisAlignment: appLanguageController.appLang == "en"
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  Text(
                    banner.title!,
                    style: UITextStyle.boldMeduim,
                  ),
                  spacer(height: 6),
                  Text(
                    banner.subtitle!,
                    style: UITextStyle.boldMeduim,
                  ),
                  spacer(),
                  SizedBox(
                    width: 80,
                    height: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: bannerButtonStyle.copyWith(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          HexColor(banner.backgroundColor!),
                        ),
                      ),
                      child: Text(
                        banner.buttonText!,
                        style:
                            UITextStyle.normalSmall.apply(fontSizeFactor: 0.7),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(),
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