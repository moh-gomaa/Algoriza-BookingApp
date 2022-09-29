import 'package:bloc/bloc.dart';
import 'package:booking_app/data/database/user_helper.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> getUserData() async {
    emit(ProfileLoadingState());
    try {
      UserHelper db = UserHelper();
      var user = await db.getAll();
      if (user.length > 0) emit(ProfileSuccessState(model: user.first));
    } catch (e) {
      emit(ProfileErrorState(error: e.toString()));
    }
  }

  // changeName(String name){
  //   emit(ProfileEditState().copyWith(name: name));
  //
  // }
  //
  // changeEmail(String email){
  //   emit(ProfileEditState().copyWith(email: email));
  // }
  //
  // submit(){
  //   print(ProfileEditState().email);
  //   print(ProfileEditState().name);
  // }

}
