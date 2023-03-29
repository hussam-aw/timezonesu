import 'dart:convert';

import 'package:timezonesu/DataAccesslayer/Clients/banner_client.dart';
import 'package:timezonesu/DataAccesslayer/Clients/brand_client.dart';

import '../Models/banner.dart';

class BannersRepo {
  BannersClient client = BannersClient();
  Future<List<AppBanner>> myBanners() async {
    var response = await client.getBanners();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();

      return data.map<AppBanner>((json) => AppBanner.fromMap(json)).toList();
    }
    return [];
  }
}
