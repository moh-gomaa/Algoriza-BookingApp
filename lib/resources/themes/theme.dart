import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

final ThemeData ownThemeData = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
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
      backwardsCompatibility: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
    ),
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: OwnTheme.colorPalette['white'],
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
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static TextStyle prNormalTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 16.sp,
        color: colorPalette['black'],
        height: 1.5,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static TextStyle prBoldTextStyle({required String lang}) {
    return TextStyle(
        fontSize: 16.sp,
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
