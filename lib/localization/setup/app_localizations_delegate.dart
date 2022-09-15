import 'package:flutter/material.dart' show BuildContext, Locale, LocalizationsDelegate;
import 'package:booking_app/localization/setup/app_localization.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations appLocalizations = AppLocalizations(locale: locale);

    AppLocalizations().setLocaleType(locale);
    await AppLocalizations().loadJsonLang();
    return AppLocalizations();
    // await appLocalizations.loadJsonLang();
    // return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

