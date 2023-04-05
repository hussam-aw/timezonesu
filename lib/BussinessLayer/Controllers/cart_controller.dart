// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/DataAccesslayer/Clients/order_client.dart';
import 'package:timezonesu/main.dart';

import '../../DataAccesslayer/Models/cart_product.dart';
import '../../DataAccesslayer/Models/product.dart';
import '../../DataAccesslayer/Repositories/products_repo.dart';
import '../../PresentationLayer/Widgets/Public/su_text_input.dart';
import '../../PresentationLayer/Widgets/snackbars.dart';
import '../Helpers/box_client.dart';

enum PaymentMethod { cashPay, onlinePay }

class CartController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();

  var paymentMethod = PaymentMethod.cashPay.obs;

  ProductsRepo productRepo = ProductsRepo();
  BoxClient boxClient = BoxClient();
  List<CartProduct> cartProducts = [];
  List<Product> products = [];

  var adding = false.obs;
  var sendingOrder = false.obs;
  TextEditingController newQtyController = TextEditingController();

  num totalValue = 0;
  num discount = 0;
  num netValue = 0;

  OrderClient orderClient = OrderClient();
  @override
  void onInit() async {
    await getCarts();
    await syncCartsOnline();
    if (MyApp.appUser != null) {
      nameController.value = TextEditingValue(text: MyApp.appUser!.name);
      emailController.value = TextEditingValue(text: MyApp.appUser!.email);
    }
    super.onInit();
  }

  Future<void> getCarts() async {
    cartProducts = await boxClient.getCartItems();
    print(cartProducts);
    update();
  }

  Future<void> syncCarts() async {
    if (products.isNotEmpty) {
      cartProducts.map((e) => e.product =
          products.where((element) => element.id == e.productId).first);
    }
    calc();
    update();
  }

  Future<void> syncCartsOnline() async {
    List<int> ids = cartProducts.map((e) => e.productId).toList();

    products = await productRepo.productsByIds(ids);
    if (products.isNotEmpty) {
      print(products);
      for (var cartitem in cartProducts) {
        cartitem.product =
            products.where((element) => element.id == cartitem.productId).first;
      }
      cartProducts.map((e) => e.product =
          products.where((element) => element.id == e.productId).first);
    }
    update();
    calc();
    update();
  }

  Future<void> addToCart(Product product) async {
    var cartProduct = CartProduct(productId: product.id, qty: 1);
    adding.value = true;
    products.add(product);
    cartProduct.product = product;
    cartProducts.add(cartProduct);
    await boxClient.addToCart(cartProducts);
    adding.value = false;
    await syncCarts();
    update();
    SnackBars.showSuccess('successMessage'.tr);
  }

  Future<void> removeAll() async {
    await boxClient.removeAllCarts();
    cartProducts.clear();
    calc();
    update();
  }

  void showEditDialog(index, oldvalue) {
    newQtyController.value = TextEditingValue(text: oldvalue.toString());
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      decoration: const BoxDecoration(
          color: UIColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Center(
        child: Column(
          children: [
            Text(
              'enterQuantityMessage'.tr,
              style: UITextStyle.boldHeading.apply(color: UIColors.blue),
            ),
            const Spacer(),
            SuTextForm(
              hint: 'quantityHint'.tr,
              obsecure: false,
              controller: newQtyController,
              type: TextInputType.number,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                minimumSize: Size(Get.width, 50),
                backgroundColor: UIColors.blue,
                textStyle: UITextStyle.boldMeduim,
              ),
              onPressed: () async {
                await editCartItemQty(index);
                Get.back();
              },
              child: Text('editButton'.tr),
            )
          ],
        ),
      ),
    ));
  }

  Future<void> editCartItemQty(index) async {
    cartProducts[index].qty = num.parse(newQtyController.value.text);
    calc();
    update();
  }

  Future<void> removeCartItemQty(index) async {
    cartProducts.removeAt(index);
    calc();
    update();
  }

  void changePaymentType(PaymentMethod method) {
    paymentMethod.value = method;
    update();
  }

  void calc() {
    totalValue = 0;
    netValue = 0;
    discount = 0;
    for (var element in cartProducts) {
      totalValue += num.parse(element.product!.price) * element.qty;
      if (num.parse(element.product!.offer) != 0) {
        discount += (num.parse(element.product!.price) -
                num.parse(element.product!.offer)) *
            element.qty;
      }

      netValue = totalValue - discount;
      update();
    }
  }

  Future<void> submitOrder() async {
    sendingOrder.value = true;
    String info = "";
    List<Map<String, dynamic>> cartitems = [];

    if (cartProducts.isEmpty) {
      SnackBars.showWarning("لا يمكن انشاء طلب فارغ");
    } else if (nameController.value.toString().isEmpty ||
        emailController.value.toString().isEmpty ||
        adressController.value.toString().isEmpty ||
        phoneController.value.toString().isEmpty) {
      SnackBars.showWarning("الرجاء إتمام الخانات المطلوبة");
    } else {
      if (paymentMethod == PaymentMethod.onlinePay &&
          cardNumberController.value.text.isEmpty) {
      } else {
        info = jsonEncode(<String, dynamic>{
          "payment_type": paymentMethod == PaymentMethod.cashPay ? 0 : 1,
          "name": nameController.value.text,
          "email": emailController.value.text,
          "address": adressController.value.text,
          "mobile_number": phoneController.value.text,
          "note": noteController.value.text,
          "customerRef": cardNumberController.value.text
        });
        for (var element in cartProducts) {
          cartitems.add(element.toApiMap());
        }
        boxClient.saveUserMail(emailController.value.text);
      }

      var response = await orderClient.postOrder(jsonDecode(info),
          MyApp.appUser != null ? MyApp.appUser!.id : null, cartitems);

      if (response == null) {
        SnackBars.showError("خطأ في الطلب , يرجى التأكد من اتصالك بالانترنت");
      } else if (response == 'Invalid') {
        SnackBars.showWarning("يرجى التأكد من رقم البطاقة");
      } else {
        SnackBars.showSuccess("تم إرسال الطلب بنجاح");
        await removeAll();
      }
    }

    sendingOrder.value = false;
  }
}
