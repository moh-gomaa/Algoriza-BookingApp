import 'blocs.dart';

  class BlocProviders {
    static final List<BlocProvider> providers = [
    BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()..getSavedLanguage()),

    BlocProvider<ConnectivityCubit>(create: (_) => ConnectivityCubit()),


    // .
    // .
    // .
    // other blocs or cubits...
  ];

}
