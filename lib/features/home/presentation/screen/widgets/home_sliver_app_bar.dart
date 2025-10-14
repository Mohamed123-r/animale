import 'package:animals/core/utils/app_color.dart';
import 'package:animals/core/utils/app_text_style.dart';
import 'package:animals/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      snap: true,
      title: Text(
        "Find Your Forever Pet",
        style: AppTextStyles.style24Bold(context),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: SvgPicture.asset(
              Assets.imagesNotification,
              color: AppColors.black20Color,
            ),
            onPressed: () {},
          ),
        ),
      ],

      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: AppTextStyles.style16Regular(
                      context,
                    ).copyWith(color: AppColors.greyColor),
                    prefixIcon: SvgPicture.asset(
                      Assets.imagesSearch,
                      fit: BoxFit.scaleDown,
                    ),
                    suffixIcon: SvgPicture.asset(
                      Assets.imagesSetting,
                      fit: BoxFit.scaleDown,
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
