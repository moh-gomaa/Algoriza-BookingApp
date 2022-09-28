import 'package:booking_app/data/data_providers/authentication_data_provider.dart';
import 'package:booking_app/data/models/user_model.dart';

class AuthenticationRepository {
  // late final AuthenticationDataProvider authenticationDataProvider;

  Future<UserModel> login(String email, String pass) async {
    var resBody = await AuthenticationDataProvider().login(email, pass);
    final UserModel model = UserModel.fromJson(resBody['data']);
    // print(model.name);
    return model;
  }

  Future<UserModel> register(UserModel obj) async {
    var resBody = await AuthenticationDataProvider().register(obj);
    final UserModel model = UserModel.fromJson(resBody['data']);
    // print(model.name);
    return model;
  }
}