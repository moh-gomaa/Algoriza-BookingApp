part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final UserModel model;

  ProfileSuccessState({required this.model});
}

class ProfileErrorState extends ProfileState {
  final String error;

  ProfileErrorState({required this.error});
}

// class ProfileEditState {
//   final String name;
//   final String email;
//
//   ProfileEditState({this.name = '', this.email = ''});
//
//   ProfileEditState copyWith({
//     String? name,
//     String? email,
//   }) =>
//       ProfileEditState(
//         name: name ?? this.name,
//         email: email ?? this.email,
//       );
// }
