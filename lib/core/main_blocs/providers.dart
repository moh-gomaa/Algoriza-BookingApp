
import 'package:booking_app/features/home/cubit/app_cubit.dart';

import 'blocs.dart';

  class BlocProviders {
    static final List<BlocProvider> providers = [

    BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()..getSavedLanguage()),

    BlocProvider<ConnectivityCubit>(create: (_) => ConnectivityCubit()),

    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
      BlocProvider<AppCubit>(create: (_) => AppCubit()),

    BlocProvider<LoginCubit>(create: (_) => LoginCubit()),


    // .
    // .
    // .
    // other blocs or cubits...
  ];

}
