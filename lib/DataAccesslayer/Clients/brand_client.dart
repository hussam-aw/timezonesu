import 'package:http/http.dart' as http;
import '../../Constants/api_links.dart';


class BrandsClient {
  Future<dynamic> getBrands() async {
    var response = await http.get(Uri.parse(baseUrlV1 + "brands"));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}