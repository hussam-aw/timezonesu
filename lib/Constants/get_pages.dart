import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/bindings/init_binding.dart';
import 'package:timezonesu/PresentationLayer/Public/category_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/home_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/notifications_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/product_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/splash_screen.dart';
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
  GetPage(name: AppRoutes.productScreen, page: () => ProductScreen()),
  GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
  GetPage(name: AppRoutes.cartScreen, page: () => ShoppingCartScreen()),
  GetPage(
      name: AppRoutes.notificationsScreen, page: () => NotificationsScreen()),
];
