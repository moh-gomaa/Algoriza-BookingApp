import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final ThemeData ownThemeData = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xff282828),
        selectedItemColor: OwnTheme.colorPalette['primary'],
        unselectedItemColor: OwnTheme.colorPalette['gray'],
        selectedLabelStyle: OwnTheme.smallTextStyle(lang: lang)
            .colorChange(color: 'primary'),
    unselectedLabelStyle: OwnTheme.smallTextStyle(lang: lang)
        .colorChange(color: 'gray'),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    ),
    primarySwatch: OwnTheme.primaryColor,
    scaffoldBackgroundColor: OwnTheme.colorPalette['black'],
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent));

class OwnTheme {
  //  ------------------------------- colorPalette ----------------------------

  static const Map<String, Color> colorPalette = <String, Color>{
    'white': Color(0xFFFFFFFF),
    'black': Color(0xFF000000),
    'disable': Color(0xFFe8e8e8),
    'gray': Color(0xFF555555),
    'lightGray': Color(0xFFF9F9F9),
    'link': Color(0xFF3784fc),
    'primary': Color(0xFF4FBE9F),
    'secondary': Color(0xFFF9C60A),
    'bg': Color(0xFF7EB1F2),
    'drawer': Color(0xFF313A42)
  };

  static const MaterialColor primaryColor = const MaterialColor(
    0xFF4FBE9F, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xFF4FBE9F ),//10%
      100: const Color(0xFF4FBE9F),//20%
      200: const Color(0xFF4FBE9F),//30%
      300: const Color(0xFF4FBE9F),//40%
      400: const Color(0xFF4FBE9F),//50%
      500: const Color(0xFF4FBE9F),//60%
      600: const Color(0xFF4FBE9F),//70%
      700: const Color(0xFF4FBE9F),//80%
      800: const Color(0xFF4FBE9F),//90%
      900: const Color(0xFF4FBE9F),//100%
    },
  );

//  ------------------------------- Various Fonts Style -------------------------

  static TextStyle hugeBoldTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 30.sp,
        color: colorPalette['black'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static TextStyle titleTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 20.sp,
        color: colorPalette['black'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static TextStyle titleBoldTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 20.sp,
        color: colorPalette['black'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static TextStyle avTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 18.sp,
        color: colorPalette['black'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static TextStyle avBoldTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: colorPalette['black'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static TextStyle prNormalTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 12.sp,
        color: colorPalette['black'],
        height: 1.5,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static TextStyle prBoldTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 12.sp,
        color: colorPalette['black'],
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static TextStyle suitableTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 14.sp,
        color: colorPalette['black'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static TextStyle suitableBoldTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 14.sp,
        color: colorPalette['black'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static TextStyle normalTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 12.sp,
        color: colorPalette['black'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static TextStyle normalBoldTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 12.sp,
        color: colorPalette['black'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static TextStyle smallTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 10.sp,
        color: colorPalette['black'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static TextStyle smallBoldTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 10.sp,
        color: colorPalette['black'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }
}
