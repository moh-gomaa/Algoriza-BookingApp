import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState());


  changeName(String name){
    emit(state.copyWith(name: name));

  }

  changeEmail(String email){
    emit(state.copyWith(email: email));
  }

  submit(){
    print(state.email);
    print(state.name);
  }
}
