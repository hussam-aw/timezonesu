import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';

class ProductsByCategoryClient {
  Future<dynamic> getProducts(categoryId) async {
    var response = await http
        .get(Uri.parse(baseUrlV1 + "/category/${categoryId}" + productsLink));
    print("sura");
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
