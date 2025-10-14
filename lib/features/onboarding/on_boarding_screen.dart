import 'package:animals/core/utils/app_color.dart';
import 'package:animals/core/utils/app_text_style.dart';
import 'package:animals/core/widgets/custom_button.dart';
import 'package:animals/features/home/presentation/screen/home_screen.dart';
import 'package:animals/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(Assets.imagesOnBoarding),
            SizedBox(height: 60),
            Text(
              "Find Your Best Companion With Us",
              textAlign: TextAlign.center,
              style: AppTextStyles.style32Bold(context),
            ),
            SizedBox(height: 12),
            Text(
              "Join & discover the best suitable pets as per your preferences in your location",
              textAlign: TextAlign.center,
              style: AppTextStyles.style16Regular(
                context,
              ).copyWith(color: AppColors.greyColor),
            ),
            SizedBox(height: 60),
            CustomButton(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.imagesPets),
                  SizedBox(width: 12),
                  Text(
                    "Get started",
                    style: AppTextStyles.style18Medium(
                      context,
                    ).copyWith(color: AppColors.whiteColor),
                  ),
                ],
              ),
              isWidget: true,
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
