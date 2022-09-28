import 'package:booking_app/resources/assets_manager/assets_manager.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/services.dart';
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
    //
    Future.delayed(const Duration(seconds: 4),(){
      debugPrint('amHere');
       Navigator.pushNamed(context, '/main');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor:OwnTheme.colorPalette['primary'],
      appBar: AppBar(
          toolbarHeight: 0.0,
          elevation: 0.0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: OwnTheme.colorPalette['primary'],
              statusBarIconBrightness: Brightness.light
          )
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [

          Lottie.asset(

              AssetsManager.splashScreenImage,
              height: size.height*.35,
              width: size.width
          )

        ],
      ),

    );
  }
}