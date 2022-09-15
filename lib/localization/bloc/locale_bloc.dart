import 'package:bloc/bloc.dart';
import 'package:booking_app/localization/setup/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/resources/constants/constants.dart';

part 'locale_event.dart';
part 'locale_state.dart';


class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const SelectedLocale(Locale('en'))) {
    on<LocaleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void toArabic() =>
      {
        AppLocalizations().setLocaleType(Locale('ar')),
        lang = 'ar',
        debugPrint(AppLocalizations().currentLang),
        emit(const SelectedLocale(Locale('ar')))
      }
  ;

  void toEnglish() =>
      {
        AppLocalizations().setLocaleType(Locale('en')),
        lang = 'en',
        debugPrint(AppLocalizations().currentLang),
        emit(const SelectedLocale(Locale('en')))
      };
}
