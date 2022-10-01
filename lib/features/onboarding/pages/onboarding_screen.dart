import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/widgets/custom_app_bar.dart';
import 'package:booking_app/features/onboarding/widgets/onboarding_bottom.dart';
import 'package:booking_app/features/onboarding/widgets/onboarding_item.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/data/models/on_boarding_model.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatelessWidget {
  var boardController = PageController();
  List<OnBoardingModel> onBoardingLst = [];

  @override
  Widget build(BuildContext context) {
    onBoardingLst = OnBoardingModel.fillLst(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomAppBar(
          leadingWidget: BackIconAppBar(
            lang: lang,
          ),
          actionWidget: TextButton(
            child: Text(
              'skip_btn'.tr(context),
              style: OwnTheme.smallTextStyle(lang: lang)
                  .colorChange(color: 'primary'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ).safeArea(),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: boardController,
              itemBuilder: (context, index) =>
                  OnboardingItem(row: onBoardingLst[index]),
              itemCount: onBoardingLst.length,
            ),
          ),
          SmoothPageIndicator(
            controller: boardController,
            count: onBoardingLst.length,
            effect: ExpandingDotsEffect(
              dotColor: OwnTheme.colorPalette['gray']!,
              expansionFactor: 3,
              activeDotColor: OwnTheme.colorPalette['primary']!,
              spacing: 5.sp,
              dotHeight: 8.sp,
              dotWidth: 8.sp,
            ),
          ),
          SizedBox(
            height: space2,
          ),
          OnboardingBottom(),
        ],
      ).wholePadding(),
    );
  }
}
