import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class AppBasicInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/page_start.png',
          width: 80.sp,
        ),
        SizedBox(
          height: space1,
        ),
        Text('booking_app_txt'.tr(context),
            style: OwnTheme.normalBoldTextStyle(lang: lang)),
        Text(
          'booking_app_desc1'.tr(context) + '\n' +
              'booking_app_desc2'.tr(context),
          style: OwnTheme.normalBoldTextStyle(lang: lang)
              .colorChange(color: 'gray'),
          textAlign: TextAlign.center,
        ),
        Lottie.asset(
          'assets/images/temp.json',
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
        ),
      ],
    );
  }
}
