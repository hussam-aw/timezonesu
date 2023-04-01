import 'package:http/http.dart' as http;
import 'package:timezonesu/Constants/api_links.dart';

class BannersClient {
  Future<dynamic> getBanners() async {
    var response = await http.get(Uri.parse(baseUrlV1 + bannersLink));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
