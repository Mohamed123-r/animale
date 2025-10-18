import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constant.dart';
import '../../../../../generated/assets.dart';
import '../../../domain/entities/breed_entity.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.pet});

  final BreedEntity pet;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (favoriteList.contains(widget.pet)) {
          favoriteList.remove(widget.pet);
        } else {
          favoriteList.add(widget.pet);
        }
        await saveFavorites();
        setState(() {});
      },
      icon: favoriteList.contains(widget.pet)
          ? SvgPicture.asset(Assets.imagesHeart2)
          : SvgPicture.asset(Assets.imagesHeart1),
    );
  }
}
