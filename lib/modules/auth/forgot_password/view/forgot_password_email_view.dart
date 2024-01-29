import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/services/firebase/auth/auth_services.dart';
import 'package:cookeat/core/utils/form_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgotPasswordEmailView extends StatelessWidget {
  const ForgotPasswordEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    final emailFormKey = GlobalKey<FormState>();
    var email = '';

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // header
          Row(
            children: [
              CustomArrowBack(
                onTap: Navigator.of(context).pop,
              ),
              const Gap(20),
              CustomText(
                'Forget Password',
                textColor: AppColors.textHeadlineColor,
                fontWeight: FontWeight.w600,
                fontSize: FontSizes.headline2,
              ),
            ],
          ),
          Gap(height * 0.2),

          Form(
            key: emailFormKey,
            child: CustomTextFormField(
              hintText: 'Email',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.mail_outline,
                color: AppColors.accentColor,
              ),
              onChanged: (String? value) {
                if (FormUtils.isEmail(value!.trim())) {
                  email = value.trim();
                }
              },
              validator: (String? value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email.';
                } else if (!FormUtils.isEmail(value.trim())) {
                  return 'Please enter a valid email.';
                }
                return null;
              },
            ),
          ),
          const Gap(15),
          const CustomText(
            // ignore: lines_longer_than_80_chars
            "Enter your registered email address and we'll send you a verification code to reset your password.",
            fontSize: FontSizes.headline6,
          ),
          const Gap(60),
          CustomElevatedButton(
            child: CustomText(
              'Send code',
              textColor: AppColors.scaffoldBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () async {
              if (emailFormKey.currentState?.validate() ?? false) {
                final sent = await AuthServices.resetPassword(email: email);
                if (sent) {
                  CustomSnackBar.showSnackBar(
                    text: 'Check your email to reset the password.',
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
