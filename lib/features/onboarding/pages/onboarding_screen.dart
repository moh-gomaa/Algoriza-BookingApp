import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/data/model_onboard/model.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardScreen extends StatelessWidget {
  var boardController =PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            TextButton(
              child: Text(
                'Skip',
              ),
              onPressed: () {
                // navigateTo(context, LoginScreen());
              },
            ),
          ]
      ),
      body:Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: boardController,
              itemBuilder: (context, index) => buildOnBoardItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          Column(
            children: [
              SmoothPageIndicator(
                controller: boardController,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.blue,
                  expansionFactor: 3,
                  activeDotColor: Colors.blue,
                  spacing: 5,
                  dotHeight: 7,
                  dotWidth: 10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),

          // ButtonKey(
          //   background: Colors.teal,
          //   text: 'Get Started',
          //   function: () => navigateTo(context, LoginScreen()),
          //   textColor: Colors.teal,),

        ],

      ),
    );
  }
  Widget buildOnBoardItem(BoardingModel model)=>Column(
    children: [
      Lottie.asset(
          '${model.image}',
        ),
      SizedBox(
        height: 30,
      ),
      Text('${model.title}',
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"),

      ),
      SizedBox(
        height: 10,
      ),
      Text('${model.subtitle}',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 16,
          color: Color(0xFF8b8b98),
          height: 1.5,
          fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
      ),
    ],
  );
}

