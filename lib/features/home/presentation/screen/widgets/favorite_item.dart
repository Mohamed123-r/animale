import 'package:animals/features/home/domain/entities/breed_entity.dart';
import 'package:animals/features/home/presentation/screen/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/assets.dart';
import 'favorite_button.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.pet});

  final BreedEntity pet;

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
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,

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
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.style14SemiBold(context),
                  ),
                  const SizedBox(height: 4),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.imagesLocation),
                      const SizedBox(width: 4),
                      Text(
                        pet.origin,
                        style: AppTextStyles.style12Regular(
                          context,
                        ).copyWith(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: FavoriteButton(pet: pet),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
