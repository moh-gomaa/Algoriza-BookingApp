import 'package:booking_app/data/models/user_model.dart';

abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final UserModel model;

  RegisterSuccessState({required this.model});
}

class RegisterErrorState extends RegisterStates {
  final String error;
    RegisterErrorState({required this.error});
}

class RegisterChangePasswordState extends RegisterStates {}
