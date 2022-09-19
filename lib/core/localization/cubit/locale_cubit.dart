import 'package:bloc/bloc.dart';
import 'package:booking_app/core/localization/helpers/language_helper.dart';
import 'package:flutter/material.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('en')));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await LanguageHelper().getLang();

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageHelper().setLang(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}

