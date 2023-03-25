// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:timezonesu/DataAccesslayer/Models/user.dart';

import '../../DataAccesslayer/Models/cart_product.dart';
import '../../DataAccesslayer/Models/favourite.dart';

class BoxClient {
  final box = GetStorage();

  get json => null;

  Future<bool> getAuthState() async {
    print(box.read('authed'));
    if (await box.read('authed') != null) {
      return true;
    }
    return false;
  }

  Future<User> getAuthedUser() async {
    return User.fromBoxMap(await box.read('userdata'));
  }

  Future<void> setAuthedUser(User user) async {
    await box.write('authed', true);
    await box.write('userdata', user.toMap());
  }

  Future<void> removeUserData() async {
    await box.remove('authed');
    await box.remove('userdata');
  }

  Future<List<CartProduct>> getCartItems() async {
    var cartItems = await box.read('su_cart_items');
    print(cartItems);
    if (cartItems != null && cartItems != "") {
      final data = cartItems.cast<Map<String, dynamic>>();
      return data
          .map<CartProduct>((json) => CartProduct.fromMap(json))
          .toList();
    }

    return [];
  }

  Future<void> addToCart(List<CartProduct> cartProducts) async {
    await box.remove('su_cart_items');
    var map = cartProducts.map((e) => e.toMap());
    await box.write('su_cart_items', map.toList());
  }

  Future<List<Favourite>> getFavorites() async {
    var favoriteItems = await box.read('su_favorites');
    if (favoriteItems != null) {
      final data =
          json.decode(jsonEncode(favoriteItems)).cast<Map<String, dynamic>>();
      return data.map<Favourite>((json) => Favourite.fromMap(json)).toList();
    }

    return [];
  }

  Future<void> addToFavorite(List<Favourite> cartProducts) async {
    await box.remove('su_favorites');
    var map = cartProducts.map((e) => e.toMap());
    await box.write('su_favorites', map.toList());
  }
}
