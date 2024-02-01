import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/router/routes.dart';
import 'package:cookeat/modules/profile/widgets/profile_single_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CookeatSettingsView extends StatelessWidget {
  const CookeatSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Parametres Kookeat',
          fontWeight: FontWeight.w600,
          textColor: AppColors.textHeadlineColor,
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CustomArrowBack(),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Gap(20),
              ProfileSingleListTile(
                route: Routes.cookeatSettingsApplicances,
                title: 'Appareils cusines',
                leading: 'machine',
                isProfileSettings: true,
              ),
              ProfileSingleListTile(
                route: Routes.cookeatSettingsIngredients,
                title: 'Ingredients á exclure',
                leading: 'fruit',
                isProfileSettings: true,
              ),
              ProfileSingleListTile(
                route: Routes.cookeatSettingsDiet,
                title: 'Regime alimentaire',
                leading: 'fish',
                isProfileSettings: true,
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
