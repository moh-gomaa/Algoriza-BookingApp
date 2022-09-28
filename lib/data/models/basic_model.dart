import 'package:booking_app/core/localization/helpers/language_helper.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';
import 'package:booking_app/resources/constants/constants.dart';

class BasicModel {
  static String userID = '';
  static String name = '';
  static String userToken = '';
  static bool isLogin = false;

  static BasicModel _instance = new BasicModel.internal();

  BasicModel.internal();

  factory BasicModel() => _instance;

  static Future<void> init() async {
    lang = await LanguageHelper().getLang();
    debugPrint('language=== $lang');
    userID = await getValuesSF("userID");
    debugPrint('userID==$userID');
    name = await getValuesSF("name");
    userToken = await getValuesSF("userToken");
    debugPrint('userToken==$userToken');

    if (userID != null) {
      isLogin = true;
    } else {
      isLogin = false;
    }
  }
}
