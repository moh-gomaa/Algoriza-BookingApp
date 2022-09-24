import 'package:booking_app/core/localization/cubit/locale_cubit.dart';
import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/localization/setup/app_localizations_setup.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/main_blocs/providers.dart';
import 'package:booking_app/features/getstarted/started_screen.dart';
import 'package:booking_app/features/login/login_screen.dart';
import 'package:booking_app/features/onboarding/pages/onboarding_screen.dart';
import 'package:booking_app/features/sigin/sigin_screen.dart';
import 'package:flutter/material.dart';
import 'resources/themes/theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocaleCubit()..getSavedLanguage(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
            builder: (context, state) {
          return MultiBlocProvider(
            providers: BlocProviders.providers,
            child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Booking App',
                  theme: ownThemeData,
                  locale: state.locale,
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,
                  home: OnBoardScreen(),
                );
              },
            ),
          );
        }));
  }
}

//Test page
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('saveBtn')),
      ),
      body: Column(
        children: [
          Text('cancelBtn'.tr(context)),
          ElevatedButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLanguage('en');
              },
              child: Text('en')),
          ElevatedButton(
              onPressed: () {
                context.read<LocaleCubit>().changeLanguage('ar');
              },
              child: Text('ar')),
        ],
      ),
    );
  }
}
