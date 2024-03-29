import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/modules/auth/complete_profile/complete_profile.dart';
import 'package:flutter/material.dart';

class CookeatSettingsDietView extends StatelessWidget {
  const CookeatSettingsDietView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Regime alimentaire',
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
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            const CompleteProfileView03(showTitle: false),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CustomElevatedButton(
                  child: CustomText(
                    'Enregistrer',
                    textColor: AppColors.scaffoldBackgroundColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
