import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';

class OrderClient {
  Future<dynamic> getOrdersById(userId) async {
    var response = await http.get(Uri.parse("$baseUrlV1/user/$userId/orders"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> getOrdersByEmail(userEmail) async {
    var response = await http.post(Uri.parse("$baseUrlV1$ordersByEmailLink"),
        body: jsonEncode(<String, dynamic>{
          "email": userEmail,
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

  Future<dynamic> postOrder(info, userId, cartitems) async {
    var response = await http.post(Uri.parse("$baseUrlV1$postorderLink"),
        body: jsonEncode(<String, dynamic>{
          "info": info,
          "user_id": userId,
          "cart": cartitems,
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
