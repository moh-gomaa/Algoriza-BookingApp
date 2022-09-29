import 'blocs.dart';

  class BlocProviders {
    static final List<BlocProvider> providers = [

    BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()..getSavedLanguage()),

    BlocProvider<ConnectivityCubit>(create: (_) => ConnectivityCubit()),

    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),

    BlocProvider<LoginCubit>(create: (_) => LoginCubit()),

    BlocProvider<RegisterCubit>(create: (_) => RegisterCubit()),

    BlocProvider<AppCubit>(create: (_) => AppCubit()..getExplore()),

    BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),

    BlocProvider<EditProfileCubit>(create: (_) => EditProfileCubit()),


    // .
    // .
    // .
    // other blocs or cubits...
  ];

}
