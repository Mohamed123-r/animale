import 'package:animals/core/helper_functions/get_it.dart';
import 'package:animals/features/home/domain/entities/breed_entity.dart';
import 'package:animals/features/home/domain/repo/breed_repo.dart';
import 'package:animals/features/home/presentation/cubits/breed_cubit.dart';
import 'package:animals/features/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/screen/details_screen.dart';
import '../../features/home/presentation/screen/favorite_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/splash/persentation/screen/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (_) => OnBoardingScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          child: HomeScreen(),
          create: (context) => BreedCubit(getIt.get<BreedRepo>()),
        ),
      );
    case DetailsScreen.routeName:
      return MaterialPageRoute(
        builder: (_) =>
            DetailsScreen(breedEntity: settings.arguments as BreedEntity),
      );
    case FavoriteScreen.routeName:
      return MaterialPageRoute(
        builder: (_) =>
            FavoriteScreen(),
      );

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
