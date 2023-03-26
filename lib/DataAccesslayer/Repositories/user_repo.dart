// ignore_for_file: avoid_print

import 'dart:convert';
import '../Clients/user_client.dart';
import '../Models/user.dart';

class UserRepo {
  var client = UserClient();

  Future<User?> login(email, password) async {
    var data = await client.login(email, password);
    print(data);
    if (data != null) {
      return User.fromMap(jsonDecode(data));
    }
    return null;
  }

  Future<User?> updateInfo(id, name, email, mobileNumber) async {
    var updatedUser = await client.updateInfo(id, name, email, mobileNumber);
    print(updatedUser);
    if (updatedUser != null) {
      return User.fromMap(jsonDecode(updatedUser));
    }
    return null;
  }
}
