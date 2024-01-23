import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:cookeat/core/utils/form_utils.dart';
import 'package:cookeat/modules/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final signUpFormKey = GlobalKey<FormState>();

    var fullName = '';
    var email = '';
    var password = '';

    var passwordVisible = false;
    var isAgreedToTerms = false;

    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: signUpFormKey,
                child: Column(
                  children: [
                    const Gap(20),
                    Row(
                      children: [
                        const CustomArrowBack(),
                        const Gap(20),
                        CustomText(
                          'Create your Account',
                          textColor: AppColors.textHeadlineColor,
                          fontWeight: FontWeight.w600,
                          fontsize: FontSizes.headline2,
                        ),
                      ],
                    ),
                    Gap(height * 0.2),
                    CustomTextFormField(
                      hintText: 'Full name',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(
                        Icons.person_outlined,
                        color: AppColors.accentColor,
                      ),
                      onChanged: (String? value) {
                        if (value!.trim().length > 2) {
                          fullName = value.trim();
                        }
                      },
                      validator: (String? value) {
                        if (value!.trim().length < 2) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                    const Gap(20),
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
                    const Gap(20),
                    Row(
                      children: [
                        StatefulBuilder(
                          builder: (context, setstate) {
                            return SizedBox(
                              height: 23,
                              width: 23,
                              child: Checkbox(
                                value: isAgreedToTerms,
                                splashRadius: 17,
                                checkColor: AppColors.backgroundColor,
                                activeColor: AppColors.accentColor,
                                side: BorderSide(
                                  color: AppColors.textColor,
                                ),
                                overlayColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      AppColors.accentColor.withOpacity(0.3),
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    setstate(() {
                                      isAgreedToTerms = value;
                                    });
                                  }
                                },
                              ),
                            );
                          },
                        ),
                        const Gap(10),
                        const CustomText(
                          'I have read and agree to ',
                          fontsize: FontSizes.headline4,
                        ),
                        GestureDetector(
                          onTap: () {
                            //
                          },
                          child: CustomText(
                            'the terms',
                            textColor: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontsize: FontSizes.headline4,
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 30,
                            left: 10,
                            right: 10,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              (state is SignUpFailed)
                                  ? 'Agree to terms to continue.'
                                  : '',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: FontSizes.headline6,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return CustomElevatedButton(
                          child: CustomText(
                            'Create account',
                            textColor: AppColors.scaffoldBackgroundColor,
                            fontWeight: FontWeight.w600,
                          ),
                          onPressed: () {
                            if (signUpFormKey.currentState!.validate()) {
                              context.read<SignUpBloc>().add(
                                    SignUpFormSubmitted(
                                      fullName: fullName,
                                      email: email,
                                      password: password,
                                      isAgreedToTerms: isAgreedToTerms,
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
          ),
        ),
      ),
    );
  }
}
