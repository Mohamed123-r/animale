import 'package:animals/core/utils/app_color.dart';
import 'package:animals/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/assets.dart' show Assets;

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.imageUrl});

  static const String routeName = '/detail';

  final String imageUrl;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.whiteColor,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: AppColors.black20Color),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.whiteColor,
              child: IconButton(
                icon: SvgPicture.asset(
                  Assets.imagesHeart1,
                  color: AppColors.black20Color,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 375,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.teal2Color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Center(
                child: Image.network(
                  widget.imageUrl,
                  height: 375,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tom",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.style28Bold(context),
                              ),

                              Row(
                                children: [
                                  SvgPicture.asset(Assets.imagesLocation),
                                  const SizedBox(width: 4),
                                  Text(
                                    '2.7 km away',
                                    style: AppTextStyles.style14Regular(
                                      context,
                                    ).copyWith(color: AppColors.greyColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '\$ ${"95"}',
                            style: AppTextStyles.style28Bold(
                              context,
                            ).copyWith(color: AppColors.tealColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 75,
                        width: 90,
                        decoration: BoxDecoration(
                          color: AppColors.teal2Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Gender",
                              style: AppTextStyles.style18Medium(context),
                            ),
                            Text(
                              "Male",
                              style: AppTextStyles.style16Regular(
                                context,
                              ).copyWith(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 90,
                        decoration: BoxDecoration(
                          color: AppColors.teal2Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style: AppTextStyles.style18Medium(context),
                            ),
                            Text(
                              "1 Year",
                              style: AppTextStyles.style16Regular(
                                context,
                              ).copyWith(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 90,
                        decoration: BoxDecoration(
                          color: AppColors.teal2Color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style: AppTextStyles.style18Medium(context),
                            ),
                            Text(
                              "10 kg",
                              style: AppTextStyles.style16Regular(
                                context,
                              ).copyWith(color: AppColors.greyColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About :',
                        style: AppTextStyles.style22SemiBold(context),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Tom is a playful and loyal Golden Retriever who loves being around people. He’s 1 years old, full of energy, and always ready for a game of fetch. Tom enjoys morning walks, belly rubs, and taking long naps after playtime. He’s gentle with kids, gets along well with other pets, and makes the perfect family companion.",
                        style: AppTextStyles.style16Regular(
                          context,
                        ).copyWith(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    title: "Adopt me",
                    onPressed: () {},
                    widget: SizedBox(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SizeItem extends StatelessWidget {
//   const SizeItem({
//     super.key,
//     required this.isSelected,
//     required this.size,
//   });
//
//   final bool isSelected;
//   final String size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       decoration: BoxDecoration(
//         color: isSelected
//             ? AppColors.purpleColor
//             : AppColors.greyFAColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Center(
//         child: Text(
//           size,
//           style: AppTextStyles.style17Medium(context).copyWith(
//             color: isSelected ? Colors.white : AppColors.grey9EColor,
//           ),
//         ),
//       ),
//     );
//   }
// }
