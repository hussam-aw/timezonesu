import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';


class FeaturedClient {
  Future<dynamic> getFeatured() async {
    var response = await http.get(Uri.parse(baseUrlV1 + "featureProducts"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}