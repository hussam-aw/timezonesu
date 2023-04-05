import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/bindings/init_binding.dart';
import 'package:timezonesu/PresentationLayer/Public/big_deals_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/brand_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/category_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/favorites_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/home_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/notifications_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/product_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/search_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/splash_screen.dart';
import 'package:timezonesu/PresentationLayer/private/checkout_screen.dart';
import 'package:timezonesu/PresentationLayer/private/order_screen.dart';
import 'package:timezonesu/PresentationLayer/private/orders_screen.dart';
import 'package:timezonesu/PresentationLayer/private/profile_screen.dart';
import 'package:timezonesu/PresentationLayer/private/shopping_cart_screen.dart';

import '../BussinessLayer/bindings/home_binding.dart';
import '../PresentationLayer/Auth/login_screen.dart';
import '../PresentationLayer/Auth/register_screen.dart';
import 'get_routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => SplashScreen(),
    binding: InitBinding(),
  ),
  GetPage(name: AppRoutes.loginscreen, page: () => LoginScreen()),
  GetPage(name: AppRoutes.registerscreen, page: () => RegisterScreen()),
  GetPage(
      name: AppRoutes.homepage,
      page: () => HomeScreen(),
      binding: HomeBindings()),
  GetPage(name: AppRoutes.categoryScreen, page: () => CategoryScreen()),
  GetPage(name: AppRoutes.brandScreen, page: () => BrandScreen()),
  GetPage(name: AppRoutes.productScreen, page: () => ProductScreen()),
  GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
      transition: Transition.circularReveal),
  GetPage(
      name: AppRoutes.cartScreen,
      page: () => ShoppingCartScreen(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: AppRoutes.checkoutScreen,
      page: () => CheckOutScreen(),
      transition: Transition.rightToLeft),
  GetPage(
      name: AppRoutes.notificationsScreen,
      page: () => NotificationsScreen(),
      transition: Transition.size),
  GetPage(
      name: AppRoutes.favouritesScreen,
      page: () => FavouritesScreen(),
      transition: Transition.circularReveal),
  GetPage(
      name: AppRoutes.bigDealsScreen,
      page: () => BigDealsScreen(),
      transition: Transition.upToDown),
  GetPage(
      name: AppRoutes.ordersScreen,
      page: () => OrdersScreen(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: AppRoutes.orderScreen,
      page: () => OrderScreen(),
      transition: Transition.zoom),
  GetPage(name: AppRoutes.searchScreen, page: () => SearchScreen()),
];
