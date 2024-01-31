import 'dart:async';

import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/router/router.dart';
import 'package:cookeat/core/services/firebase/auth/auth_services.dart';
import 'package:cookeat/modules/profile/widgets/profile_single_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Parametres de compte',
          fontWeight: FontWeight.w600,
          textColor: AppColors.textHeadlineColor,
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CustomArrowBack(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(20),
              const ProfileSingleListTile(
                route: Routes.editProfile,
                title: 'Modifier mon profile',
                leading: 'person',
                isProfileSettings: true,
              ),
              const ProfileSingleListTile(
                route: Routes.changePassword,
                title: 'Changer le mot de passe',
                leading: 'lock',
                isProfileSettings: true,
              ),
              const ProfileSingleListTile(
                route: Routes.changeLanguage,
                title: 'Change la langue',
                leading: 'language',
                isProfileSettings: true,
              ),
              const ProfileSingleListTile(
                route: Routes.profileDeliveryAddress,
                title: 'Adresse de livraison',
                leading: 'location',
                isProfileSettings: true,
              ),
              const Spacer(),
              CustomElevatedButton(
                backgroundColor: AppColors.scaffoldBackgroundColor,
                borderSide: BorderSide(color: AppColors.accentColor),
                child: CustomText(
                  'Se déconnecter',
                  textColor: AppColors.accentColor,
                ),
                onPressed: () async {
                  await CustomLoadingOverlay.show(
                    asyncFunction: () async {
                      final signedOut = await AuthServices.signOut();
                      if (signedOut) {
                        unawaited(
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushNamed(Routes.auth),
                        );
                      }
                    },
                  );
                },
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
