part of 'navigation_cubit.dart';

@immutable
class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState({
    required this.navbarItem,
    required this.index,
  });

  List<Object> get props => [this.navbarItem, this.index];

}

