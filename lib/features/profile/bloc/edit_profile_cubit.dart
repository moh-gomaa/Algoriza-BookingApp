import 'package:bloc/bloc.dart';
import 'package:booking_app/data/database/user_helper.dart';
import 'package:booking_app/data/models/basic_model.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState());

  changeName(String name) => emit(state.copyWith(name: name));

  changeEmail(String email) => emit(state.copyWith(email: email));

  submit() async {
    debugPrint('BasicModel.userID==${BasicModel.userID}');
    UserModel tmp = UserModel(
        name: state.name, email: state.email, id: int.parse(BasicModel.userID));
    UserHelper db = UserHelper();
    await db.update(tmp);
    var x = await db.getAll();
    debugPrint('NoOfUsers==${x.length}');
  }
}
