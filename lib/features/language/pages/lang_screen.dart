import 'package:booking_app/core/localization/helpers/language_helper.dart';
import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:lottie/lottie.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OwnTheme.colorPalette['white'],
      bottomSheet: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'الرجاء اختيار اللغة',
            style: OwnTheme.normalBoldTextStyle(lang: 'ar'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: space0),
            child: Text(
              'Please select language',
              style: OwnTheme.normalBoldTextStyle(lang: 'en'),
            ),
          ),
          ButtonKey(
            buttonText: 'عربي',
            language: 'ar',
            function: (){
              LanguageHelper().setLang('ar');
              Navigator.pushReplacementNamed(context, '/getStarted');
            },
          ),
          SizedBox(
            height: space1,
          ),
          ButtonKey(
            buttonText: 'English',
            language: 'en',
            backgroundColor: OwnTheme.colorPalette['gray'],
            function: (){
              LanguageHelper().setLang('en');
              Navigator.pushReplacementNamed(context, '/getStarted');
            },
          ),
        ],
      ).wholePadding(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/images/booking.json',
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          Text(
            'booking_app_txt'.tr(context),
            style: OwnTheme.avBoldTextStyle(lang: lang)
                .colorChange(color: 'primary'),
          )
        ],
      ).safeArea().wholePadding(),
    );
  }
}
