import 'package:get/get.dart';
import 'package:timezonesu/BussinessLayer/Helpers/langs/ar.dart';
import 'package:timezonesu/BussinessLayer/Helpers/langs/en.dart';

class TranslationsHelper extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
