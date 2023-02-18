import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';

class TzDrawer extends StatelessWidget {
  const TzDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: EdgeInsets.zero,
          color: UIColors.blue,
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: UIColors.red),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: UIColors.lightGrey,
                    backgroundImage:
                        AssetImage("assets/images/user-default.png"),
                  ),
                  accountName: Text("Ali"),
                  accountEmail: Text("Ali@timezone.store")),
              ListTile(
                title: Text(
                  "Home",
                  style: UITextStyle.boldMeduim.apply(fontSizeFactor: .8),
                ),
                leading: const Icon(
                  Icons.home,
                  color: UIColors.activeIcon,
                ),
              ),
              ListTile(
                title: Text("Categories",
                    style: UITextStyle.boldMeduim.apply(fontSizeFactor: .8)),
                leading: const Icon(Icons.category, color: UIColors.activeIcon),
              ),
              ListTile(
                title: Text("Top Sales",
                    style: UITextStyle.boldMeduim.apply(fontSizeFactor: .8)),
                leading:
                    const Icon(Icons.shopping_bag, color: UIColors.activeIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
