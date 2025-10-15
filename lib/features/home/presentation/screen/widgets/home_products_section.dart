import 'package:animals/generated/assets.dart';
import 'package:flutter/material.dart';
import '../details_screen.dart';
import 'product_item.dart';

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final pets = [
      {
        'name': 'Joli',
        'image': Assets.imagesOnBoarding,
        'gender': 'Female',
        'age': '5 Months Old',
        'distance': '1.6 km away',
      },
      {
        'name': 'Tom',
        'image': Assets.imagesTest1,
        'gender': '',
        'age': '1 year Old',
        'distance': '2.7 km away',
      },
      {
        'name': 'Joli',
        'image': Assets.imagesOnBoarding,
        'gender': 'Female',
        'age': '5 Months Old',
        'distance': '1.6 km away',
      },
      {
        'name': 'Tom',
        'image': Assets.imagesTest1,
        'gender': '',
        'age': '1 year Old',
        'distance': '2.7 km away',
      },
      {
        'name': 'Joli',
        'image': Assets.imagesOnBoarding,
        'gender': 'Female',
        'age': '5 Months Old',
        'distance': '1.6 km away',
      },
      {
        'name': 'Tom',
        'image': Assets.imagesTest1,
        'gender': '',
        'age': '1 year Old',
        'distance': '2.7 km away',
      },
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList.separated(
        itemCount: pets.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final pet = pets[index];
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 16 : 0),
            child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,
                      DetailsScreen.routeName,
                      arguments: pets[index]['image']);
                },
                child: ProductItem(pet: pet)),
          );
        },
      ),
    );
  }
}

