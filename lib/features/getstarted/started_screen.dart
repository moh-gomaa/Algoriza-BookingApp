import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/page_start.png',
              height: 65,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Booking App',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8b8b98),
                    fontWeight: FontWeight.w500,
                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    'Best hotel deals for your holiday',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8b8b98),
                        fontWeight: FontWeight.w500,
                        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/images/temp.json',
                    ),
                  ],
                ),
              ),
            ),
            ButtonKey(
              buttonText: 'Get Started',
              function: (){ Navigator.pushNamed(context, '/onboard'); },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8b8b98),
                      fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8b8b98),
                        fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
