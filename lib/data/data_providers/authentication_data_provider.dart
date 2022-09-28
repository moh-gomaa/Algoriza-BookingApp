import 'package:booking_app/core/utils/network/remote/dio_helper.dart';
import 'package:booking_app/data/models/user_model.dart';

class AuthenticationDataProvider {
  Future<dynamic> login(String email, String pass) async {
    Map<String, dynamic> userData = {"email": email, "password": pass};

    return DioHelper.post('auth/login', body: userData);
  }

  Future<dynamic> register(UserModel obj) async {
    return DioHelper.post('auth/register', body: obj.toJson());
  }
}
