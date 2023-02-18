import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

class TZBottomNavigationBar extends StatelessWidget {
  const TZBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: UIColors.primary,
      selectedItemColor: UIColors.activeIcon,
      selectedFontSize: 12,
      unselectedItemColor: UIColors.inActiveIcon.withOpacity(0.5),
      unselectedFontSize: 12,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
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
