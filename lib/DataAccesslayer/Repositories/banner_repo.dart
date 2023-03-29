import 'dart:convert';

import 'package:timezonesu/DataAccesslayer/Clients/banner_client.dart';
import 'package:timezonesu/DataAccesslayer/Clients/brand_client.dart';

import '../Models/banner.dart';

class BannerRepo {
  BannersClient client = BannersClient();
  Future<List<Banner>> myBanners() async {
    var response = await client.getBanners();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Banner>((json) => Banner.fromMap(json)).toList();
    }
    return [];
  }
}
