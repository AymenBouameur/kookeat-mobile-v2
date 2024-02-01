import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/modules/auth/complete_profile/complete_profile.dart';
import 'package:flutter/material.dart';

class CookeatSettingsIngredientsView extends StatelessWidget {
  const CookeatSettingsIngredientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Ingrédients á exclure',
          fontWeight: FontWeight.w600,
          textColor: AppColors.textHeadlineColor,
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CustomArrowBack(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const CompleteProfileView02(showTitle: false),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: CustomElevatedButton(
                child: CustomText(
                  'Enregistrer',
                  textColor: AppColors.scaffoldBackgroundColor,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
