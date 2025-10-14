
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case SplashScreen.routeName:
    //   return MaterialPageRoute(builder: (_) => SplashScreen());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
