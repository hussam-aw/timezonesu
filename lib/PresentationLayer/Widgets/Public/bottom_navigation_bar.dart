// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezonesu/Constants/get_routes.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/main.dart';

class TZBottomNavigationBar extends StatelessWidget {
  const TZBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: UIColors.red,
      selectedItemColor: UIColors.activeIcon,
      selectedFontSize: 12,
      unselectedItemColor: Colors.white.withOpacity(.5),
      unselectedFontSize: 12,
      currentIndex: MyApp.bottomSelectedItem,
      type: BottomNavigationBarType.fixed,
      onTap: ((value) {
        MyApp.bottomSelectedItem = value;
        print(MyApp.bottomSelectedItem);
        switch (value) {
          case 0:
            Get.toNamed(AppRoutes.homepage);
            break;

          case 1:
            Get.toNamed(AppRoutes.notificationsScreen);
            break;

          case 2:
            Get.toNamed(AppRoutes.cartScreen);
            break;
          case 3:
            Get.toNamed(AppRoutes.cartScreen);
            break;
          case 4:
            //if (MyApp.appUser != null) Get.toNamed(AppRoutes.profileScreen);
            Get.toNamed(AppRoutes.profileScreen);
            break;
        }
      }),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 32,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
          ),
          label: 'My Bag',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star_border,
          ),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
