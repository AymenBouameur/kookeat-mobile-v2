import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/core/components/custom_elevated_button.dart';
import 'package:cookeat/core/components/custom_text.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:cookeat/modules/auth/sign_in/widgets/social_auth_button_widget.dart';
import 'package:cookeat/modules/auth/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                '${Constants.vectorsPath}app-logo.svg',
                height: 140,
              ),
              const Gap(40),
              SocialAuthButtonWidget(
                icon: 'google-logo',
                title: 'Google',
                onPressed: () {},
              ),
              const Gap(15),
              SocialAuthButtonWidget(
                icon: 'apple-logo',
                title: 'Apple',
                onPressed: () {},
              ),
              const Gap(15),
              SocialAuthButtonWidget(
                icon: 'facebook-logo',
                title: 'Facebook',
                onPressed: () {},
              ),
              const Gap(35),
              const CustomText(
                'Or Continue with',
                fontWeight: FontWeight.w500,
              ),
              const Gap(20),
              CustomElevatedButton(
                child: CustomText(
                  'Sign In With Password',
                  textColor: AppColors.scaffoldBackgroundColor,
                  fontWeight: FontWeight.w600,
                ),
                onPressed: () {
                  AuthView.pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  "Don't have an account? ",
                  textColor: AppColors.textColor,
                ),
                GestureDetector(
                  onTap: () {
                    AuthView.pageController.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                  child: CustomText(
                    'Sign up',
                    textColor: AppColors.accentColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
