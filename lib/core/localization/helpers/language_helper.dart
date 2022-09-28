import 'package:booking_app/core/localization/cubit/locale_cubit.dart';
import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/foundation.dart';

class LanguageHelper {
  Future<void> setLang(String languageCode) async {
    debugPrint('Set language code= $languageCode');
    addStringToSF('lang', languageCode);
    LocaleCubit().changeLanguage(languageCode);
    lang = languageCode;
  }

  Future<String> getLang() async {
    final cachedLanguageCode = await getValuesSF('lang');
    // debugPrint('Get cachedLanguageCode= $cachedLanguageCode');
    if (cachedLanguageCode.isNotEmpty) {
      lang = cachedLanguageCode;
      return cachedLanguageCode;
    } else {
      lang = '';
      addStringToSF('lang', '');
      // debugPrint('Return default language');
      return "en";
    }
  }
}
