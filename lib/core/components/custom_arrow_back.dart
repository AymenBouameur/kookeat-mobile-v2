import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/core/router/app_router.dart';
import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => AppRouter.navigatorKey.currentState?.pop(),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.textHeadlineColor,
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 20,
          color: AppColors.textHeadlineColor,
        ),
      ),
    );
  }
}
