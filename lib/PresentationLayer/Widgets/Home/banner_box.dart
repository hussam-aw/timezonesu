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
    return banner.type == 'dynamic'
        ? Container(
            width: 280,
            decoration: BoxDecoration(
              borderRadius: raduis15,
              color: HexColor(banner.backgroundColor!),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: appLanguageController.appLang == 'en'
                        ? const EdgeInsets.only(left: 20)
                        : const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: appLanguageController.appLang == "en"
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Text(
                          banner.title!,
                          style: UITextStyle.boldMeduim,
                        ),
                        spacer(height: 5),
                        Text(
                          banner.subtitle!,
                          style: UITextStyle.boldMeduim,
                        ),
                        spacer(height: 5),
                        SizedBox(
                          width: 80,
                          height: 20,
                          child: ElevatedButton(
                            onPressed: () {
                              //Use button link
                            },
                            style: bannerButtonStyle.copyWith(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                HexColor(banner.backgroundColor!),
                              ),
                            ),
                            child: Text(
                              banner.buttonText!,
                              style: UITextStyle.normalSmall
                                  .apply(fontSizeFactor: 0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 90,
                    child: Image.network(
                      banner.dynamicImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            width: 280,
            decoration: BoxDecoration(
              borderRadius: raduis15,
              color: UIColors.lightGrey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(banner.staticImage!),
              ),
            ),
          );
  }
}
