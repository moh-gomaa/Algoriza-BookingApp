import 'dart:async';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/core/utils/network/remote/dio_helper.dart';
import 'package:booking_app/features/register/bloc/register_state.dart';


class RegisterCubit extends Bloc<LoginCubit, RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String firstname,
    required String lastname,
    required String email,
    required String password,

  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: 'auth/register', data: {
      'firstname': firstname,
      'lastname' : lastname,
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(
        RegisterErrorState(error.toString()),
      );
    });
  }
}
