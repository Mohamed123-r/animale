
import 'package:animals/features/onboarding/on_boarding_screen.dart';
import 'package:animals/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../../constant.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utils/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
      //   CacheHelper.sharedPreferences.getBool(kIsLogin) == true
      //       ? HomeScreen.routeName
      //       :
             OnBoardingScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Center(
        child: Image.asset(Assets.imagesHeart, width: 200, height: 180),
      ),
    );
  }
}
