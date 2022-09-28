import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/data/models/basic_model.dart';
import 'package:booking_app/resources/assets_manager/assets_manager.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        if (lang == '')
          Navigator.pushNamedAndRemoveUntil(
              context, '/lang', (Route<dynamic> route) => false);
        else if (BasicModel.isLogin)
          Navigator.pushNamedAndRemoveUntil(
              context, '/main', (Route<dynamic> route) => false);
        else
          Navigator.pushNamedAndRemoveUntil(
              context, '/onboarding', (Route<dynamic> route) => false);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: OwnTheme.colorPalette['white'],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/gradient_bg.webp'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AssetsManager.splashScreenImage,
                height: size.height * .35, width: size.width),
            SizedBox(
              height: space2,
            ),
            Text(
              'booking_app_txt'.tr(context),
              style: OwnTheme.suitableBoldTextStyle(lang: lang),
            )
          ],
        ),
      ),
    );
  }
}
