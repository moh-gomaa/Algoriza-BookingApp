import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';

class LanguageHelper {
  Future<void> setLang(String languageCode) async {
    addStringToSF('lang', languageCode);
  }

  Future<String> getLang() async {
    final cachedLanguageCode = await getValuesSF('lang');

    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}
