import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/data/model_onboard/model.dart';
import 'package:booking_app/features/login/login_screen.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatelessWidget {
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          child: Text(
            'Skip',
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildOnBoardItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.blue,
                      expansionFactor: 3,
                      activeDotColor: Colors.blue,
                      spacing: 5,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                ],
              ),
            ),
            ButtonKey(
              function: () {
                Navigator.pushNamed(context, '/login');
              },
              buttonText: 'Login',
            ),
            SizedBox(
              height: 5,
            ),
            ButtonKey(
              buttonText: 'Create account',
              function: () {
                Navigator.pushNamed(context, '/sigin');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardItem(BoardingModel model) => SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(
              '${model.image}',
            ),
            Padding(
              padding: const EdgeInsets.all(space1),
              child: Text(
                '${model.title}',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"),
              ),
            ),
            Text(
              '${model.subtitle}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8b8b98),
                  height: 1.5,
                  fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
            ),
          ],
        ),
      );
}
