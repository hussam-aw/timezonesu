import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/drawer.dart';
import 'package:timezonesu/PresentationLayer/Widgets/Public/timezome_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: tzAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: UIColors.activeIcon,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: UIColors.activeIcon,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          drawer: const TzDrawer(),
          body: const SizedBox(),
        ));
  }
}
