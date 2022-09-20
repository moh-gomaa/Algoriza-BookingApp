import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';
import 'package:flutter/foundation.dart';

class LanguageHelper {
  Future<void> setLang(String languageCode) async {
    debugPrint('Set language code= $languageCode');
    addStringToSF('lang', languageCode);
  }

  Future<String> getLang() async {
    final cachedLanguageCode = await getValuesSF('lang');
    debugPrint('Get cachedLanguageCode= $cachedLanguageCode');
    if (cachedLanguageCode.isNotEmpty) {
      return cachedLanguageCode;
    } else {
      debugPrint('Return default language');
      return "en";
    }
  }
}
