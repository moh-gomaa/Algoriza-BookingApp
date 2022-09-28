part of 'edit_profile_cubit.dart';

@immutable
class EditProfileState {
  final String name;
  final String email;

  EditProfileState({this.name = '2222', this.email = ''});

  EditProfileState copyWith({
    String? name,
    String? email,
  }) =>
      EditProfileState(
        name: name ?? this.name,
        email: email ?? this.email,
      );
}


