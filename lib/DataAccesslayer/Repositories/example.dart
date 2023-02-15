import 'dart:convert';

import 'package:timezonesu/DataAccesslayer/Clients/example.dart';
import 'package:timezonesu/DataAccesslayer/Models/example.dart';

class ExampleRepo {
  ExampleClient client = ExampleClient();

  Future<List<Example>> getExamples() async {
    var response = await client.fetchExamples();
    if (response != null) {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map<Example>((json) => Example.fromMap(json)).toList();
    } else {
      return [];
    }
  }
}
