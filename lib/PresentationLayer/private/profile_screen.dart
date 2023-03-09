import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UIColors.primary,
      appBar: tzAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: UIColors.activeIcon,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(
                    'My Profile',
                    style: UITextStyle.boldHeading,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          minRadius: 68,
                          backgroundColor: UIColors.circleAvatarBorder,
                          child: CircleAvatar(
                            minRadius: 63,
                            backgroundColor: UIColors.circleAvatarBackground,
                          ),
                        ),
                        spacer(height: 25),
                        Text(
                          'Ali Alsaeed',
                          style: UITextStyle.boldMeduim.copyWith(
                            color: UIColors.normalText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Form(
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: profileInputsStyle,
                              ),
                              spacer(height: 14),
                              TextFormField(
                                decoration: profileInputsStyle,
                              ),
                              spacer(height: 14),
                              TextFormField(
                                decoration: profileInputsStyle,
                              ),
                              spacer(height: 14),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: profileInputsStyle,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: acceptButtonWithBorderStyle,
                            child: const Text(
                              'Update Profile Info',
                              style: UITextStyle.boldMeduim,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
