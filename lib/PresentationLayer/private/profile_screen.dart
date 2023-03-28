import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/profile_controller.dart';
import 'package:timezonesu/Constants/api_links.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/DataAccesslayer/Models/user.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';
import 'package:timezonesu/main.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  User? user;
  final profileController = Get.find<ProfileController>();

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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: GetBuilder<ProfileController>(
              builder: (context) {
                user = MyApp.appUser;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      child: Text(
                        'profileTitle'.tr,
                        style: UITextStyle.boldHeading,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: CircleAvatar(
                                minRadius: 68,
                                backgroundColor: UIColors.circleAvatarBorder,
                                child: CircleAvatar(
                                  minRadius: 63,
                                  backgroundColor:
                                      UIColors.circleAvatarBackground,
                                  child: ClipOval(
                                    child: user!.avatar != 'users/default.png'
                                        ? Image.network(user!.avatar)
                                        : Image.asset(
                                            'assets/images/user-default.png',
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            spacer(height: 20),
                            Expanded(
                              flex: 1,
                              child: Text(
                                user!.name,
                                style: UITextStyle.boldMeduim.copyWith(
                                  color: UIColors.normalText,
                                ),
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
                              flex: 10,
                              child: Column(
                                children: [
                                  TextFormField(
                                    enabled: false,
                                    keyboardType: TextInputType.name,
                                    decoration: profileInputsStyle.copyWith(
                                      hintText: user!.name,
                                    ),
                                  ),
                                  spacer(height: 14),
                                  TextFormField(
                                    enabled: false,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: profileInputsStyle.copyWith(
                                      hintText: user!.email,
                                    ),
                                  ),
                                  spacer(height: 14),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller:
                                        profileController.updateNameController,
                                    decoration: profileInputsStyle.copyWith(
                                      hintText: 'leaveEmptyHint'.tr,
                                    ),
                                  ),
                                  spacer(height: 14),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller:
                                        profileController.updateEmailController,
                                    decoration: profileInputsStyle.copyWith(
                                      hintText: 'emailHint'.tr,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: Get.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    profileController.updateInfo();
                                  },
                                  style: acceptButtonWithBorderStyle,
                                  child: Text(
                                    'updateProfileInfoButton'.tr,
                                    style: UITextStyle.boldMeduim,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
