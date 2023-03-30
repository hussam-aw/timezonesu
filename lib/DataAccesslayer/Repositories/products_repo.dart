// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:timezonesu/DataAccesslayer/Models/cart_product.dart';

import '../Clients/products_client.dart';
import '../Models/product.dart';

class ProductsRepo {
  ProductsClient client = ProductsClient();

  Future<List<Product>> products(categoryId) async {
    var response = await client.getProducts(categoryId);
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Product>((json) => Product.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Product>> brandProducts(brandId) async {
    var response = await client.getBrandProducts(brandId);
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Product>((json) => Product.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<CartProduct>> bigDealProducts() async {
    var response = await client.getBigDealProdcts();
    if (response != "") {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed
          .map<CartProduct>((json) => CartProduct.fromMap(json))
          .toList();
    }
    return [];
  }

  Future<List<Product>> productsByIds(ids) async {
    var response = await client.getProductsByIds(ids);
    if (response != null) {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Product>((json) => Product.fromMap(json)).toList();
    }
    return [];
  }
}
