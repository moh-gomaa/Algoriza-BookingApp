import 'package:booking_app/core/localization/helpers/language_helper.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';
import 'package:booking_app/resources/constants/constants.dart';

class BasicModel {
  static String userID = '';
  static String name = '';
  static String userToken = '';
  static String userImage = '';
  static bool isLogin = false;

  static BasicModel _instance = new BasicModel.internal();

  BasicModel.internal();

  factory BasicModel() => _instance;

  static Future<void> init() async {
    lang = await LanguageHelper().getLang();
    debugPrint('language=== $lang');
    userID = await getValuesSF("userID");
    debugPrint('userID==$userID');
    debugPrint('isLogin==$isLogin');
    name = await getValuesSF("name");
    userToken = await getValuesSF("userToken");
    userImage = await getValuesSF("userImage");
    debugPrint('userToken==$userToken');

    if (userID != '') {
      isLogin = true;
    } else {
      isLogin = false;
    }
  }
}
