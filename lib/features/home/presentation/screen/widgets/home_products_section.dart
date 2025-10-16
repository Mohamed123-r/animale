import 'package:animals/core/utils/app_color.dart';
import 'package:animals/features/home/domain/entities/breed_entity.dart';
import 'package:animals/features/home/presentation/screen/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../details_screen.dart';

class HomeProductsSection extends StatelessWidget {
  final List<BreedEntity> pets;
  final bool isLoading;

  const HomeProductsSection({
    super.key,
    required this.pets,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList.separated(
        itemCount: pets.length + (isLoading ? 1 : 0),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index < pets.length) {
            final pet = pets[index];
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 16 : 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments: pet,
                  );
                },
                child: ProductItem(pet: pet),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: CircularProgressIndicator(color: AppColors.tealColor),
            ),
          );
        },
      ),
    );
  }
}
