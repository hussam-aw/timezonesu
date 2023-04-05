// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';

class NotificationClient {
  Future<dynamic> getNotifications(id) async {
    var response = await http.get(Uri.parse("$baseUrlV1/notifications"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getNotificationsByEmail(email) async {
    var response = await http.post(Uri.parse("$baseUrlV1$ordersByEmailLink"),
        body: jsonEncode(<String, dynamic>{
          "email": email,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
