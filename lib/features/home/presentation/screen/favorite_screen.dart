import 'package:animals/features/home/presentation/screen/widgets/custom_categories_section.dart'
    show CustomCategoriesSection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/assets.dart';
import 'details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        title: Text(
          "You Favorite Pets",
          style: AppTextStyles.style24Bold(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            CustomCategoriesSection(),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      //  arguments: pet,
                    );
                  },
                  child: FavoriteItem(),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

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
                  "pet.reference_image_id.toImageUrl()!",
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
                    "pet.name!",
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
                        "pet.origin!",
                        style: AppTextStyles.style12Regular(
                          context,
                        ).copyWith(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.teal2Color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),

                    onTap: () {},
                    child: SvgPicture.asset(Assets.imagesHeart2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
