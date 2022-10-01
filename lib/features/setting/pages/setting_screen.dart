import 'package:booking_app/core/localization/helpers/language_helper.dart';
import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/widgets/custom_app_bar.dart';
import 'package:booking_app/features/profile/bloc/profile_cubit.dart';
import 'package:booking_app/features/setting/widgets/setting_list_tile.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  String pageLang = lang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocaleCubit, ChangeLocaleState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is ChangeLocaleState){
            pageLang = lang;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              CustomAppBar(
                lang: pageLang,
                leadingWidget: BackIconAppBar(
                  lang: pageLang,
                ),
              ).safeArea(),
              Padding(
                padding:
                const EdgeInsets.only(bottom: bottom, right: side, left: side),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'setting_txt'.tr(context),
                          style: OwnTheme.avBoldTextStyle(lang: lang)
                              .colorChange(color: 'white'),
                        ),
                        SizedBox(
                          height: space2,
                        ),
                        SettingListTile(
                          text: 'lang_txt'.tr(context),
                          value: lang == 'ar' ? 'العربية' : 'English',
                          onTap: () {
                            String languageCode = lang == 'ar' ? 'en' : 'ar';
                            LanguageHelper().setLang(languageCode);
                          },
                          // widget: Container(
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //       borderRadius:
                          //       BorderRadius.circular(round),
                          //       border: Border.all(
                          //           color: OwnTheme.colorPalette['primary']!,
                          //           width: 0.2),
                          //       color: OwnTheme.colorPalette['white']),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         right: space1, left: space1),
                          //     child: Row(
                          //       mainAxisAlignment:
                          //       MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Text(
                          //           '44',
                          //           // AppLocalizations.of(context)!.setting3,
                          //           style:
                          //           OwnTheme.suitableBoldTextStyle(lang: lang),
                          //         ),
                          //         Text(
                          //           'en',
                          //           // AppLocalizations.of(context)!.lang,
                          //           style:
                          //           OwnTheme.suitableBoldTextStyle(lang: lang),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
