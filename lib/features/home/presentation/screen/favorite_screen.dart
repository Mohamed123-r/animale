import 'package:animals/features/home/domain/entities/breed_entity.dart';
import 'package:animals/features/home/presentation/screen/widgets/custom_categories_section.dart'
    show CustomCategoriesSection;
import 'package:animals/features/home/presentation/screen/widgets/favorite_item.dart';
import 'package:animals/features/home/presentation/screen/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant.dart';
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
              child: ValueListenableBuilder<List<BreedEntity>>(
                valueListenable: favoriteNotifier,
                builder: (context, favs, _) {
                  if (favs.isEmpty) {
                    return SizedBox(
                      height: 200,
                      child: Center(child: Text('No favorites yet')),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: favs.length,
                    itemBuilder: (context, index) {
                      BreedEntity petList = favs[index];

                      return GestureDetector(
                        onTap: () async {
                          // يمكنك انتظار نتيجة من الشاشة التفصيلية لو أردت
                          await Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: petList,
                          );
                          // لا حاجة لاعادة تحميل هنا لأن notifier سيحدث تلقائيًا من الـ Details إذا استُخدم toggleFavorite
                        },
                        child: FavoriteItem(pet: petList),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.8,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}