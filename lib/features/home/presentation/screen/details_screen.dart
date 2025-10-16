import 'package:animals/core/utils/app_color.dart';
import 'package:animals/core/widgets/custom_button.dart';
import 'package:animals/features/home/domain/entities/breed_entity.dart';
import 'package:animals/features/home/presentation/screen/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/assets.dart' show Assets;

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.breedEntity});

  static const String routeName = '/detail';

  final BreedEntity breedEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColors.tealColor),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: SvgPicture.asset(
                Assets.imagesHeart1,
                color: AppColors.tealColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          title: "Adopt me",
          onPressed: () {},
          widget: SizedBox(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 375,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.teal2Color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  breedEntity.reference_image_id.toImageUrl(),
                  height: 375,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                breedEntity.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.style28Bold(context),
                              ),

                              Row(
                                children: [
                                  SvgPicture.asset(Assets.imagesLocation),
                                  const SizedBox(width: 4),
                                  Text(
                                    breedEntity.origin,
                                    style: AppTextStyles.style14Regular(
                                      context,
                                    ).copyWith(color: AppColors.greyColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Text(
                          //   '\$ ${"95"}',
                          //   style: AppTextStyles.style28Bold(
                          //     context,
                          //   ).copyWith(color: AppColors.tealColor),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 75,

                            decoration: BoxDecoration(
                              color: AppColors.teal2Color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Age",
                                  style: AppTextStyles.style18Medium(context),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "(${breedEntity.lifeSpan}) Years",
                                  style: AppTextStyles.style16Regular(
                                    context,
                                  ).copyWith(color: AppColors.greyColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            height: 75,

                            decoration: BoxDecoration(
                              color: AppColors.teal2Color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Weight",
                                  style: AppTextStyles.style18Medium(context),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "(${breedEntity.weight.metric!}) Kg",
                                  style: AppTextStyles.style16Regular(
                                    context,
                                  ).copyWith(color: AppColors.greyColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About :',
                        style: AppTextStyles.style22SemiBold(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        breedEntity.description,
                        style: AppTextStyles.style16Regular(
                          context,
                        ).copyWith(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
