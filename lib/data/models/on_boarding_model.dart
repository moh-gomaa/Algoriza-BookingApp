import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnBoardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  static List<OnBoardingModel> fillLst(BuildContext context) {
    List<OnBoardingModel> tmp = [
      OnBoardingModel(
          image: 'assets/images/loading.json',
          title: 'onboarding_title1_txt'.tr(context),
          subtitle: 'onboarding_desc1'.tr(context)),
      OnBoardingModel(
          image: 'assets/images/travel.json',
          title: 'onboarding_title2_txt'.tr(context),
          subtitle: 'onboarding_desc2'.tr(context)),
      OnBoardingModel(
          image: 'assets/images/booking.json',
          title: 'onboarding_title3_txt'.tr(context),
          subtitle: 'onboarding_desc3'.tr(context)),
    ];
    return tmp;
  }
}

