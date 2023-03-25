// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';

class NotificationClient {
  Future<dynamic> getNotifications(id) async {
    var response = await http.get(Uri.parse("${baseUrlV1}notifications"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
