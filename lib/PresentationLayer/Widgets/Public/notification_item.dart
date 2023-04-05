import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_styles.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';

import '../../../DataAccessLayer/Models/notification.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.userNotification});
  final UserNotification userNotification;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: raduis15,
        color: UIColors.white,
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              borderRadius: raduis15,
              color: UIColors.lightGrey,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userNotification.title,
                style: UITextStyle.boldMeduim.apply(color: UIColors.primary),
              ),
              if (userNotification.subtitle.isNotEmpty)
                Text(
                  userNotification.subtitle,
                  style:
                      UITextStyle.normalMeduim.apply(color: UIColors.darkGrey),
                ),
              if (userNotification.time.isNotEmpty)
                Text(
                  userNotification.time,
                  style:
                      UITextStyle.normalSmall.apply(color: UIColors.darkGrey),
                )
            ],
          ))
        ],
      ),
    );
  }
}
