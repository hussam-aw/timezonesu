import 'dart:convert';

import '../../DataAccessLayer/Models/notification.dart';
import '../Clients/notification_client.dart';

class NotificationRepo {
  var client = NotificationClient();

  Future<List<UserNotification>> getNotifications(id) async {
    var response = await client.getNotifications(id);
    if (response.isNotEmpty) {
      final myNotifications =
          json.decode(response).cast<Map<String, dynamic>>();
      return myNotifications
          .map<UserNotification>((json) => UserNotification.fromMap(json))
          .toList();
    }
    return [];
  }
}
