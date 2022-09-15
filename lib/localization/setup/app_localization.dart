import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json;

import 'app_localizations_delegate.dart';
//Not worked yet but can be implemented soon
class AppLocalizations {
   late Locale locale;

  // AppLocalizations({this.locale,});

  // Edit in Localization
  //  print('localization Commit');

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final AppLocalizations instance = AppLocalizations._();

  factory AppLocalizations() => instance;

  AppLocalizations._();

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

   void setLocaleType(Locale loc){
     locale = loc;
   }

  Future<void> loadJsonLang() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key){
     // debugPrint('key= $key');
     // debugPrint('value=' + (_localizedStrings[key] ?? ''));
     return  _localizedStrings[key] ?? '';
  }

  bool get inEnLocale => locale.languageCode == 'en';

  String get currentLang => locale.languageCode;
}

extension TranslateX on String {
  String tr() {
    return AppLocalizations().translate(this) ;
  }

}
