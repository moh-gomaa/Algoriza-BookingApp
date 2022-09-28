import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';

class OnboardingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonKey(
          function: () {
            Navigator.pushNamed(context, '/login');
          },
          buttonText: 'login_btn'.tr(context),
        ),
        SizedBox(
          height: space1,
        ),
        ButtonKey(
          buttonText: 'create_account_btn'.tr(context),
          function: () {
            Navigator.pushNamed(context, '/register');
          },
        ),

      ],
    );
  }
}
