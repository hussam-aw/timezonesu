import 'dart:convert';

import 'package:timezonesu/DataAccesslayer/Models/product.dart';

import '../Clients/featured_client.dart';

class FeaturedRepo {
  FeaturedClient client = FeaturedClient();
  Future<List<Product>> myFeaturedProducts() async {
    var response = await client.getFeatured();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Product>((json) => Product.fromMap(json)).toList();
    }
    return [];
  }
}
