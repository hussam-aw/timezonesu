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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 75, right: 20, bottom: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'Create Account',
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
                              hintText: "Enter Your Name",
                            ),
                          ),
                          spacer(height: 15),
                          TextFormField(
                            controller: authController.registerEmailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: authInputsStyle.copyWith(
                              hintText: "Enter Your Email",
                            ),
                          ),
                          spacer(height: 25),
                          TextFormField(
                            controller:
                                authController.registerPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: authInputsStyle.copyWith(
                              hintText: 'Enter Your Password',
                              suffixIcon: const Icon(Icons.visibility),
                            ),
                          ),
                          spacer(height: 25),
                          TextFormField(
                            controller:
                                authController.registerRepasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: authInputsStyle.copyWith(
                              hintText: 'Confirm Your Password',
                              suffixIcon: const Icon(Icons.visibility),
                            ),
                          ),
                          spacer(height: 25),
                          SizedBox(
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: acceptButtonStyle,
                              child: const Text(
                                'Create Account',
                                style: UITextStyle.normalMeduim,
                              ),
                            ),
                          ),
                          spacer(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have an account ? ',
                                style: UITextStyle.normalMeduim.copyWith(
                                  color: UIColors.darknormalText,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Login',
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
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: UIColors.lightGrey,
                  ),
                  child: const Center(
                    child: Text(
                      'Get Full Aceess',
                      style: UITextStyle.boldHeading,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
