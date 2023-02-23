import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/auth_controller.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                ClipPath(
                  clipper: HeaderClipPath(),
                  child: Container(
                    height: 200,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: UIColors.primary,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Welcome Back',
                            style: UITextStyle.boldHeading,
                          ),
                          spacer(height: 16),
                          const Text(
                            'Please Sign In To Your Account',
                            style: UITextStyle.normalHeading,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                spacer(height: 30),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: authController.loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: authInputsStyle.copyWith(
                            hintText: "Enter Your Email",
                          ),
                        ),
                        spacer(height: 20),
                        TextFormField(
                          controller: authController.loginPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: authInputsStyle.copyWith(
                            hintText: 'Enter Your Password',
                            suffixIcon: const Icon(Icons.visibility),
                          ),
                        ),
                        spacer(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Forget Password?',
                              style: UITextStyle.normalMeduim.copyWith(
                                color: UIColors.darknormalText,
                              ),
                            ),
                          ),
                        ),
                        spacer(height: 50),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              await authController.login();
                            },
                            style: acceptButtonStyle,
                            child: const Text(
                              'Continue',
                              style: UITextStyle.normalMeduim,
                            ),
                          ),
                        ),
                        spacer(),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.homepage);
                            },
                            style: normalButtonWithBorderStyle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Skip',
                                  style: UITextStyle.normalMeduim
                                      .copyWith(color: UIColors.darknormalText),
                                ),
                              ],
                            ),
                          ),
                        ),
                        spacer(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ? ',
                              style: UITextStyle.normalMeduim.copyWith(
                                color: UIColors.darknormalText,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                authController.goToRegister();
                              },
                              child: Text(
                                'Create One',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
