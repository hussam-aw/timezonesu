// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

import '../../Constants/api_links.dart';

class ExampleClient {
  var client = http.Client();

  Future<dynamic> fetchExamples() async {
    var response = await client.get(Uri.parse(baseUrl + exampleLink));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
