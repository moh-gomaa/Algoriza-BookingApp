import 'dart:async';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/network/remote/dio_helper.dart';
part 'login_state.dart';

class LoginCubit extends Bloc<LoginCubit, LoginStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'auth/login',
        data: {
          'email': ' email',
          'password': ' password',
        }
    ).then((value) {
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error){
      emit(LoginErrorState(error.toString()),);
    });
  }

}
