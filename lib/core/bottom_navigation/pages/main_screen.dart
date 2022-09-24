import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/main_blocs/blocs.dart';
import 'package:booking_app/features/home/pages/home_screen.dart';
import 'package:booking_app/features/profile/pages/profile_main_screen.dart';
import 'package:booking_app/resources/constants/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_rounded,
                ),
                label: 'explore_txt'.tr(context),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                label: 'trips_txt'.tr(context),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'profile_txt'.tr(context),
              ),
            ],
            onTap: (index) {
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(index: index);
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return HomeScreen();
        } else if (state.navbarItem == NavbarItem.settings) {
          return ProfileMainScreen();
        } else if (state.navbarItem == NavbarItem.profile) {
          return ProfileMainScreen();
        }
        return Container();
      }),
    );
  }
}
