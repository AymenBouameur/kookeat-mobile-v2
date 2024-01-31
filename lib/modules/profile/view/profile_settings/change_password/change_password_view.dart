import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Changer le mot de passe',
          maxLines: 1,
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
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormField(
                        hintText: 'Mot de passe actuel',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.textHeadlineColor,
                        ),
                        onChanged: (String? value) {
                          if (value!.length >= 8) {
                            // password = value;
                          }
                        },
                        validator: (String? value) {
                          if (value == '') {
                            return 'Please enter your password.';
                          } else if (!(value!.length >= 8)) {
                            // ignore: lines_longer_than_80_chars
                            return 'The password must contain more than 7 characters.';
                          }
                          return null;
                        },
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        hintText: 'Nouveau mot de passe',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.textHeadlineColor,
                        ),
                        onChanged: (String? value) {
                          if (value!.length >= 8) {
                            // password = value;
                          }
                        },
                        validator: (String? value) {
                          if (value == '') {
                            return 'Please enter your password.';
                          } else if (!(value!.length >= 8)) {
                            // ignore: lines_longer_than_80_chars
                            return 'The password must contain more than 7 characters.';
                          }
                          return null;
                        },
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        hintText: 'Confirmer mot de passe',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.textHeadlineColor,
                        ),
                        onChanged: (String? value) {
                          if (value!.length >= 8) {
                            // password = value;
                          }
                        },
                        validator: (String? value) {
                          if (value == '') {
                            return 'Please enter your password.';
                          } else if (!(value!.length >= 8)) {
                            // ignore: lines_longer_than_80_chars
                            return 'The password must contain more than 7 characters.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
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
      ),
    );
  }
}
