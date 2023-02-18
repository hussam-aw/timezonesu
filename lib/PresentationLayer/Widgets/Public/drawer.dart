import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

class TzDrawer extends StatelessWidget {
  const TzDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * .7,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                    ),
                    SizedBox(width: 30),
                    Text(
                      "Ali Ali",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Home'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Categories'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Brands'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Featured Products'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
