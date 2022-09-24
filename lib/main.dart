import 'package:booking_app/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:booking_app/core/connectivity/pages/connectivity_Screen.dart';
import 'package:booking_app/core/localization/cubit/locale_cubit.dart';
import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/localization/setup/app_localizations_setup.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/main_blocs/providers.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'resources/themes/theme.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return Sizer(
            builder: (BuildContext context, Orientation orientation,
                DeviceType deviceType) {
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
                home: BlocBuilder<ConnectivityCubit, ConnectivityState>(
                    builder: (context, state) {
                  if (state is InternetConnected) {
                    return Test();
                  } else if (state is InternetDisconnected) {
                    return ConnectivityScreen();
                  }
                  return CircularProgressIndicator();
                }),
              );
            },
          );
        },
      ),
    );
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
          Text(
            'loginBtn'.tr(context),
            style: OwnTheme.titleBoldTextStyle(lang: lang)
                .colorChange(color: 'primary'),
          ),
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
