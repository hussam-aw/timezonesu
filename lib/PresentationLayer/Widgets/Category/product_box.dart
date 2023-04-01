import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Controllers/cart_controller.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';
import 'package:timezonesu/DataAccesslayer/Models/product.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/spaces.dart';

class ProductBox extends StatelessWidget {
  const ProductBox(
      {super.key, required this.product, required this.cartController});

  final Product product;
  final CartController cartController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        height: 100,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: UIColors.primary,
          borderRadius: raduis20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.productScreen,
                            arguments: [product]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: UIColors.white,
                          borderRadius: raduis10,
                          image: DecorationImage(
                            image: NetworkImage(
                              product.images[0],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.brand,
                            style: UITextStyle.boldHeading,
                          ),
                          spacer(height: 4),
                          Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: UITextStyle.normalMeduim
                                .apply(fontSizeFactor: .8),
                          ),
                          spacer(),
                          Row(
                            children: [
                              Text(
                                product.price,
                                style: UITextStyle.boldMeduim.copyWith(
                                  color: num.parse(product.offer) != 0
                                      ? UIColors.lightGrey
                                      : UIColors.white,
                                  decoration: num.parse(product.offer) != 0
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              if (num.parse(product.offer) != 0)
                                const SizedBox(width: 10),
                              if (num.parse(product.offer) != 0)
                                Text(
                                  product.offer,
                                  style: UITextStyle.boldMeduim.copyWith(
                                    color: UIColors.white,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () async {
                  cartController.addToCart(product);
                },
                icon: const Icon(
                  Icons.add_shopping_cart_sharp,
                  color: UIColors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
