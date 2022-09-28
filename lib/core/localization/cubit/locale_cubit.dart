import 'package:bloc/bloc.dart';
import 'package:booking_app/core/localization/helpers/language_helper.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {

  static final LocaleCubit _instance = LocaleCubit._();

  factory LocaleCubit() => _instance;

  LocaleCubit._() : super(ChangeLocaleState(locale: Locale('en'))) {}

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await LanguageHelper().getLang();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    // print(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
