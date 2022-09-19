
import 'package:booking_app/core/localization/cubit/locale_cubit.dart';

import 'blocs.dart';

  class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()..getSavedLanguage()),


    // .
    // .
    // .
    // other blocs or cubits...
  ];
}
