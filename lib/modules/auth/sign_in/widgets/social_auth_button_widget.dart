import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/core/components/custom_elevated_button.dart';
import 'package:cookeat/core/components/custom_text.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SocialAuthButtonWidget extends StatelessWidget {
  const SocialAuthButtonWidget({
    required this.icon,
    required this.title,
    required this.onPressed,
    super.key,
  });
  final String icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      borderSide: BorderSide(color: AppColors.accentColor.withOpacity(0.5)),
      onPressed: onPressed,
      child: Center(
        child: Row(
          children: [
            const Gap(40),
            SvgPicture.asset(
              '${Constants.vectorsPath}$icon.svg',
              height: 22,
            ),
            const Gap(20),
            CustomText(
              'Continue with $title',
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
