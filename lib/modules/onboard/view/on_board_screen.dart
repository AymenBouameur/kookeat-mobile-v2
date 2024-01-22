import 'package:cookeat/config/theme/app_font_sizes.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({
    required this.text,
    required this.image,
    super.key,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('${Constants.imagesPath}$image.png'),
        const Gap(15),
        Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: FontSizes.headline1,
          ),
        ),
      ],
    );
  }
}
