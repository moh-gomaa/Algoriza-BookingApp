import 'dart:async';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';
import 'package:booking_app/data/database/user_helper.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/data/repositories/authentication_repository.dart';

part 'login_state.dart';

class LoginCubit extends Bloc<LoginCubit, LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login({
    required String email,
    required String pass,
  }) async {
    emit(LoginLoadingState());
    try {
      UserModel userData = await AuthenticationRepository().login(email, pass);
      if (userData != null) {
        UserHelper db = UserHelper();
        await db.deleteAll();
        db.savePost(userData);
        debugPrint('UserName==${userData.name}');
        await addStringToSF('userID', '${userData.id}');
        await addStringToSF('name', '${userData.name}');
        await addStringToSF('userToken', '${userData.apiToken}');
        emit(LoginSuccessState(model: userData));
      }
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }
  }
}
