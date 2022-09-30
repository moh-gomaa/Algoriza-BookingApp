import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/data/models/on_boarding_model.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingItem extends StatelessWidget {
  final OnBoardingModel row;

  const OnboardingItem({required this.row});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Lottie.asset(
            '${row.image}',
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: space2),
            child: Text('${row.title}',
                style: OwnTheme.avBoldTextStyle(lang: lang)
                    .colorChange(color: 'white')),
          ),
          Text('${row.subtitle}',
              textAlign: TextAlign.center,
              style: OwnTheme.prNormalTextStyle(lang: lang)
                  .colorChange(color: 'white')),
        ],
      ),
    );
  }
}
