import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Cart/payment_method_item.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/loading_item.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/page_title.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/su_text_input.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key});
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      /* bottomNavigationBar: const TZBottomNavigationBar(), */
      backgroundColor: UIColors.lightprimary,
      appBar: tzAppBar(),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GetBuilder(
                init: cartController,
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pageTitle('checkOut'.tr),
                      Expanded(
                        flex: 9,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacer(height: 30),
                              SuTextForm(
                                hint: "قم بإدخال اسمك",
                                obsecure: false,
                                controller: cartController.nameController,
                              ),
                              spacer(),
                              SuTextForm(
                                hint: "قم بإدخال بريدك الإلكتروني",
                                obsecure: false,
                                controller: cartController.emailController,
                              ),
                              spacer(),
                              SuTextForm(
                                hint: "قم بإدخال عنوانك",
                                obsecure: false,
                                controller: cartController.adressController,
                              ),
                              spacer(),
                              SuTextForm(
                                hint: "قم بإدخال رقم للتواصل",
                                obsecure: false,
                                controller: cartController.phoneController,
                              ),
                              spacer(),
                              SuTextForm(
                                hint: "ملاحظات",
                                obsecure: false,
                                controller: cartController.noteController,
                                minLines: 3,
                              ),
                              spacer(height: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "paymentmethod".tr,
                                    style: UITextStyle.normalMeduim,
                                  ),
                                  spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: InkWell(
                                                onTap: () => cartController
                                                    .changePaymentType(
                                                        PaymentMethod.cashPay),
                                                child: paymentMethodItem(
                                                    Icons.money,
                                                    "cash_payment".tr,
                                                    cartController.paymentMethod
                                                            .value ==
                                                        PaymentMethod
                                                            .cashPay))),
                                        Expanded(
                                            child: InkWell(
                                                onTap: () => cartController
                                                    .changePaymentType(
                                                        PaymentMethod
                                                            .onlinePay),
                                                child: paymentMethodItem(
                                                    Icons.credit_card_outlined,
                                                    "online_payment".tr,
                                                    cartController.paymentMethod
                                                            .value ==
                                                        PaymentMethod
                                                            .onlinePay)))
                                      ],
                                    ),
                                  ),
                                  spacer(),
                                  if (cartController.paymentMethod.value ==
                                      PaymentMethod.onlinePay)
                                    SuTextForm(
                                        hint: "entercardnumber".tr,
                                        obsecure: true,
                                        controller:
                                            cartController.cardNumberController)
                                ],
                              ),
                              spacer(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 12),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'totalText'.tr,
                                          style:
                                              UITextStyle.normalMeduim.copyWith(
                                            color: UIColors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 35),
                                        Text(
                                          cartController.totalValue.toString(),
                                          style:
                                              UITextStyle.normalMeduim.copyWith(
                                            color: UIColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          'discountText'.tr,
                                          style:
                                              UITextStyle.normalMeduim.copyWith(
                                            color: UIColors.specialText,
                                          ),
                                        ),
                                        const SizedBox(width: 35),
                                        Text(
                                          cartController.discount.toString(),
                                          style:
                                              UITextStyle.normalMeduim.copyWith(
                                            color: UIColors.specialText,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                    spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          'netValueText'.tr,
                                          style: UITextStyle.normalMeduim,
                                        ),
                                        const SizedBox(width: 30),
                                        Text(
                                          cartController.netValue.toString(),
                                          style: UITextStyle.normalMeduim,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() {
                                return SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                      style: successButtonStyle,
                                      onPressed: () async {
                                        await cartController.submitOrder();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (cartController.sendingOrder.value)
                                            loadingItem(false),
                                          Text(
                                            "sendorder".tr,
                                            style: UITextStyle.normalMeduim,
                                          )
                                        ],
                                      )),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
