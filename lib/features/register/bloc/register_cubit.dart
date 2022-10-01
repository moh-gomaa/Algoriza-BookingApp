import 'dart:async';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/network/remote/end_points.dart';
import 'package:booking_app/core/utils/shared_preferences/shared_preferences_helper.dart';
import 'package:booking_app/data/database/user_helper.dart';
import 'package:booking_app/data/models/basic_model.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/data/repositories/authentication_repository.dart';
import 'package:booking_app/features/register/bloc/register_state.dart';

class RegisterCubit extends Bloc<LoginCubit, RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> register({
    required UserModel obj,
  }) async {
    emit(RegisterLoadingState());
    try {
      UserModel userData = await AuthenticationRepository().register(obj);
      if (userData != null) {
        String userImg = '';
        if(userData.image !=null){
          debugPrint('hasImage');
          userImg = '${imgBaseUrl}${userData.image}';
        }
        UserHelper db = UserHelper();
        await db.deleteAll();
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
        BasicModel.userImage = userImg ;
        emit(RegisterSuccessState(model: userData));
      }
    } catch (e) {
      emit(RegisterErrorState(error: e.toString()));
    }
  }

  IconData suffix =Icons.visibility_outlined;
  bool isPassword=true;


  void ChangePassword(){
    isPassword =!isPassword;
    suffix = isPassword ? Icons.visibility_outlined :Icons.visibility_off_outlined;
    emit(RegisterChangePasswordState());
  }

}
