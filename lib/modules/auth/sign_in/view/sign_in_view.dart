import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/config/theme/app_font_sizes.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/router/routes.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:cookeat/core/utils/form_utils.dart';
import 'package:cookeat/modules/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:cookeat/modules/auth/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    final emailPasswordFormKey = GlobalKey<FormState>();
    var email = '';
    var password = '';
    var passwordVisible = false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: BlocProvider(
              create: (_) => SignInBloc(),
              child: Column(
                children: [
                  const Gap(20),
                  Row(
                    children: [
                      CustomArrowBack(
                        onTap: () {
                          //
                          AuthView.pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastEaseInToSlowEaseOut,
                          );
                          // in case a keyboard is open.
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      const Gap(20),
                      CustomText(
                        'Welcome Back',
                        textColor: AppColors.textHeadlineColor,
                        fontWeight: FontWeight.w600,
                        fontsize: FontSizes.headline2,
                      ),
                    ],
                  ),
                  Gap(height * 0.2),
                  Form(
                    key: emailPasswordFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: 'Email',
                          textInputAction: TextInputAction.next,
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
                        const Gap(20),
                        StatefulBuilder(
                          builder: (context, setstate) {
                            return CustomTextFormField(
                              hintText: 'Password',
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !passwordVisible,
                              suffixIcon: Icon(
                                passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: AppColors.textColor,
                              ),
                              suffixIconOnTap: () {
                                setstate(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: AppColors.accentColor,
                              ),
                              onChanged: (String? value) {
                                if (value!.length >= 8) {
                                  password = value;
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.forgotPassword);
                        },
                        child: const CustomText(
                          'Forgot Password?',
                          fontWeight: FontWeight.w400,
                          fontsize: FontSizes.headline5,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Builder(
                    builder: (context) {
                      return CustomElevatedButton(
                        child: CustomText(
                          'Sign in',
                          textColor: AppColors.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w600,
                        ),
                        onPressed: () {
                          if (emailPasswordFormKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(
                                  SignInFormSubmitted(
                                    email: email,
                                    password: password,
                                  ),
                                );
                          }
                        },
                      );
                    },
                  ),
                  const Gap(30),
                  const CustomText(
                    'Or Continue with',
                    fontWeight: FontWeight.w500,
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          '${Constants.vectorsPath}google-logo.svg',
                          height: 40,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          '${Constants.vectorsPath}apple-logo.svg',
                          height: 40,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          '${Constants.vectorsPath}facebook-logo.svg',
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                    Navigator.pushNamed(context, Routes.signUp);
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
