import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/auth_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 55, right: 20, bottom: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          'createAccountText'.tr,
                          style: UITextStyle.boldHeading
                              .copyWith(color: UIColors.primary),
                        ),
                      ),
                      spacer(height: 30),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: authController.registerNameController,
                              keyboardType: TextInputType.name,
                              decoration: authInputsStyle.copyWith(
                                hintText: 'nameHint'.tr,
                              ),
                            ),
                            spacer(height: 15),
                            TextFormField(
                              controller:
                                  authController.registerEmailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: authInputsStyle.copyWith(
                                hintText: 'emailHint'.tr,
                              ),
                            ),
                            spacer(height: 25),
                            TextFormField(
                              controller:
                                  authController.registerPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: authInputsStyle.copyWith(
                                hintText: 'passwordHint'.tr,
                                suffixIcon: const Icon(Icons.visibility),
                              ),
                            ),
                            spacer(height: 25),
                            TextFormField(
                              controller:
                                  authController.registerRepasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: authInputsStyle.copyWith(
                                hintText: 'confirmPasswordHint'.tr,
                                suffixIcon: const Icon(Icons.visibility),
                              ),
                            ),
                            spacer(height: 25),
                            SizedBox(
                              width: Get.width,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: acceptButtonStyle,
                                child: Text(
                                  'createAccountText'.tr,
                                  style: UITextStyle.normalMeduim,
                                ),
                              ),
                            ),
                            spacer(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'haveAnAccountText'.tr,
                                  style: UITextStyle.normalMeduim.copyWith(
                                    color: UIColors.darknormalText,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'loginText'.tr,
                                    style: UITextStyle.normalMeduim.copyWith(
                                      color: UIColors.darknormalText,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipPath(
                  clipper: FooterClipPath(),
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: UIColors.lightGrey,
                    ),
                    child: Center(
                      child: Text(
                        'getFullAccessMessage'.tr,
                        style: UITextStyle.boldHeading,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);

    path.lineTo(0, 50);

    var firstControlPoint = Offset(size.width / 4, 0);
    var firstPoint = Offset(size.width / 2, 0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), 0);
    var secondPoint = Offset(size.width, 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
