part of 'locale_bloc.dart';

@immutable
abstract class LocaleState {
  final Locale locale;
  const LocaleState(this.locale);
}

class SelectedLocale extends LocaleState {
  const SelectedLocale(super.locale);

}
