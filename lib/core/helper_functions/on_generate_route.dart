import 'package:animals/features/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/screen/details_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/splash/persentation/screen/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (_) => OnBoardingScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => HomeScreen());
   case DetailsScreen.routeName:
      return MaterialPageRoute(builder: (_) => DetailsScreen(
        imageUrl: settings.arguments as String ,
      ));

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
