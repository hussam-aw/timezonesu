import 'package:get/get.dart';
import 'package:timezonesu/PresentationLayer/Public/home_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/product_screen.dart';
import 'package:timezonesu/PresentationLayer/Public/splash_screen.dart';

import '../BussinessLayer/bindings/home_binding.dart';
import '../PresentationLayer/Auth/login_screen.dart';
import '../PresentationLayer/Auth/register_screen.dart';
import 'get_routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(name: AppRoutes.splashscreen, page: () => SplashScreen()),
  GetPage(name: AppRoutes.loginscreen, page: () => LoginScreen()),
  GetPage(name: AppRoutes.registerscreen, page: () => RegisterScreen()),
  GetPage(
      name: AppRoutes.homepage,
      page: () => HomeScreen(),
      binding: HomeBindings()),
  GetPage(name: AppRoutes.productScreen, page: () => const ProductScreen()),
];
