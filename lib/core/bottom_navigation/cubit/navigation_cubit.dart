import 'package:bloc/bloc.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(NavigationState(index: 0, navbarItem: NavbarItem.home));

  void getNavBarItem({required int index}) {
    switch (index) {
      case 0:
        emit(NavigationState(index: 0, navbarItem: NavbarItem.home));
        break;
      case 1:
        emit(NavigationState(index: 1, navbarItem: NavbarItem.settings));
        break;
      case 2:
        emit(NavigationState(index: 2, navbarItem: NavbarItem.profile));
        break;
    }
  }
}
