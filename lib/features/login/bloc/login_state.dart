part of 'login_cubit.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {

}

class LoginSuccessState extends LoginStates {
  final UserModel model;

  LoginSuccessState({required this.model});
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState({required this.error});
}

class LoginChangePasswordState extends LoginStates {}