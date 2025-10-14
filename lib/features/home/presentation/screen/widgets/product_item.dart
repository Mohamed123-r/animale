import 'package:animals/core/utils/app_color.dart';
import 'package:animals/core/utils/app_text_style.dart';
import 'package:animals/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.pet});

  final Map<String, String> pet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pet Image
          Container(
            height: 112,
            width: 112,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.teal2Color,
            ),
            child: Image.asset(pet['image']!, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          // Pet Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pet['name']!, style: AppTextStyles.style18Bold(context)),
                const SizedBox(height: 4),
                pet['gender']!.isNotEmpty
                    ? Text(
                        pet['gender']!,
                        style: AppTextStyles.style14Regular(
                          context,
                        ).copyWith(color: AppColors.greyColor),
                      )
                    : Text(
                        "Male & Female",
                        style: AppTextStyles.style14Regular(
                          context,
                        ).copyWith(color: AppColors.greyColor),
                      ),
                Text(
                  pet['age']!,

                  style: AppTextStyles.style14Regular(
                    context,
                  ).copyWith(color: AppColors.greyColor),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesLocation),
                    const SizedBox(width: 4),
                    Text(
                      pet['distance']!,
                      style: AppTextStyles.style14Regular(
                        context,
                      ).copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Favorite Icon
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.imagesHeart1),
          ),
        ],
      ),
    );
  }
}
