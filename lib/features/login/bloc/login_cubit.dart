import 'dart:async';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/network/remote/end_points.dart';
import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';
import 'package:booking_app/data/database/user_helper.dart';
import 'package:booking_app/data/models/basic_model.dart';
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
        String userImg = '${imgBaseUrl}${userData.image}';
        UserHelper db = UserHelper();
        await db.deleteAll();

        var x=await db.getAll();
        debugPrint('Before Login UsersNum=${x.length}');

        db.savePost(UserModel(
          id: userData.id,
          name: userData.name,
          email: userData.email,
          apiToken: userData.apiToken,
          image: userImg
        ));
        debugPrint('UserName==${userData.name}');
        await addStringToSF('userID', '${userData.id}');
        await addStringToSF('name', '${userData.name}');
        await addStringToSF('userToken', '${userData.apiToken}');
        await addStringToSF('userImage', userImg);
        BasicModel.name = userData.name ?? '';
        BasicModel.userID = userData.id.toString();
        BasicModel.userToken = userData.apiToken ?? '';
        BasicModel.userImage = userImg;

        var s=await db.getAll();
        debugPrint('After Login UsersNum=${s.length}');

        emit(LoginSuccessState(model: userData));
      }
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }
  }
}
