import 'package:animals/core/utils/app_color.dart';
import 'package:animals/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  static List category = ["All", "Cats", "Gogs", "Fish", "Birds", "Reptiles"];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Categories',
              style: AppTextStyles.style20Bold(context),
            ),
          ),
          SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 0,
                  right: index == category.length - 1 ? 16 : 0,
                ),
                child: CategoryItem(title: category[index],
                isSelected:index==1  ,
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, this.isSelected = false});

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isSelected ? AppColors.tealColor : AppColors.teal2Color,
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.style14SemiBold(context).copyWith(
            color: isSelected ? AppColors.whiteColor : AppColors.tealColor,
          ),
        ),
      ),
    );
  }
}
