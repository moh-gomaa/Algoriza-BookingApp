import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonKey(
          buttonText: 'get_started_btn'.tr(context),
          function: () {
            Navigator.pushNamed(context, '/onboarding');
          },
        ),
        SizedBox(
          height: space2,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'have_account_txt'.tr(context) + ' ',
                style: OwnTheme.smallTextStyle(lang: lang)
                    .colorChange(color: 'white')),
            TextSpan(
              text: 'login_btn'.tr(context),
              style: OwnTheme.smallBoldTextStyle(lang: lang)
                  .colorChange(color: 'white'),
              recognizer: new TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamed(context, '/login'),
            ),
          ]),
        ),
      ],
    );
  }
}
