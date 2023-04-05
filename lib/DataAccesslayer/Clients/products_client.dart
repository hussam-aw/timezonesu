// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';

class ProductsClient {
  Future<dynamic> getAll() async {
    var response = await http.get(Uri.parse("$baseUrlV1$productsLink"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getProducts(categoryId) async {
    var response = await http
        .get(Uri.parse("$baseUrlV1/category/$categoryId$productsLink"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getBrandProducts(brandId) async {
    var response =
        await http.get(Uri.parse("$baseUrlV1/brand/$brandId$productsLink"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getBigDealProdcts() async {
    var response = await http.get(Uri.parse("$baseUrlV1$bigDealProductsLink"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getProductsByIds(ids) async {
    print(ids);
    var response = await http.post(Uri.parse(baseUrlV1 + productsByIdLink),
        body: jsonEncode(<String, dynamic>{"ids": ids}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
