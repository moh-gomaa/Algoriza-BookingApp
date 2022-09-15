import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:booking_app/localization/setup/app_localization.dart';

class AppLocalizationsSetup {
  static const Iterable<Locale> supportedLocales = [Locale('en'), Locale('ar')];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Locale localeResolutionCallback(
      Locale? deviceLocale, Iterable<Locale> supportedLocales) {
    for (Locale locale in supportedLocales) {
      if (deviceLocale != null &&
          locale.languageCode == deviceLocale.languageCode) {
        return locale;
      }
    }
    return supportedLocales.first;
  }
}
