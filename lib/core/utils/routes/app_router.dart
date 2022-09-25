import 'package:booking_app/core/bottom_navigation/pages/main_screen.dart';
import 'package:booking_app/features/home/pages/home_screen.dart';
import 'package:booking_app/features/profile/pages/profile_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static const animationDuration = Duration(milliseconds: 600);
  static PageTransition? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/main':
        return PageTransition(
          child: MainScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

        case '/profileDetails':
        return PageTransition(
          child: ProfileDetailsScreen(),
          type: PageTransitionType.rightToLeft,
          duration: animationDuration,
          settings: settings,
        );

      // case '/SessionsDatesScreen':
      //   bool? isBookingScreen = settings.arguments as bool?;
      //   return PageTransition(
      //     child: SessionsDatesScreen(isBookingScreen: isBookingScreen ?? true),
      //     type: PageTransitionType.rightToLeft,
      //     duration: animationDuration,
      //     settings: settings,
      //   );
      //

      default:
        return null;
    }
  }
}
