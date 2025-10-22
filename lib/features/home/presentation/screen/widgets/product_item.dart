import 'package:animals/core/utils/app_color.dart';
import 'package:animals/core/utils/app_text_style.dart';
import 'package:animals/features/home/domain/entities/breed_entity.dart';
import 'package:animals/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'favorite_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.pet});

  final BreedEntity pet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.topRight,
      children: [
        Container(
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
            children: [
              Container(
                height: 112,
                width: 112,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.teal2Color,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    pet.reference_image_id.toImageUrl()!,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Pet Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.style18Bold(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "(${pet.lifeSpan}) Years",
                      style: AppTextStyles.style14Regular(
                        context,
                      ).copyWith(color: AppColors.greyColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "(${pet.weight.metric!}) Kg",

                      style: AppTextStyles.style14Regular(
                        context,
                      ).copyWith(color: AppColors.greyColor),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.imagesLocation),
                        const SizedBox(width: 4),
                        Text(
                          pet.origin!,
                          style: AppTextStyles.style14Regular(
                            context,
                          ).copyWith(color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        FavoriteButton(pet: pet),
      ],
    );
  }
}

extension ImageUrlX on String {
  String toImageUrl() {
    return 'https://cdn2.thecatapi.com/images/$this.jpg';
  }
}
