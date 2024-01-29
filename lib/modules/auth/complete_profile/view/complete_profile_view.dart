import 'dart:async';

import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/data/models/user_model.dart';
import 'package:cookeat/core/router/router.dart';
import 'package:cookeat/core/services/firebase/auth/user_serviecs.dart';
import 'package:cookeat/modules/auth/complete_profile/complete_profile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  final pageController = PageController();
  int pageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(20),
              SizedBox(
                height: 8,
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: LinearProgressIndicator(
                  value: 0.33 * (pageIndex + 1),
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Gap(40),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                  },
                  children: const [
                    CompleteProfileView01(),
                    CompleteProfileView02(),
                    CompleteProfileView03(),
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (pageIndex != 0)
                      CustomElevatedButton(
                        width: 80,
                        backgroundColor: AppColors.scaffoldBackgroundColor,
                        borderSide: BorderSide(
                          color: AppColors.dividerColor,
                        ),
                        onPressed: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastEaseInToSlowEaseOut,
                          );
                        },
                        child: Text(
                          'Prev',
                          style: TextStyle(
                            fontSize: FontSizes.headline4,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dividerColor,
                          ),
                        ),
                      ),
                    const Spacer(),
                    CustomElevatedButton(
                      width: 80,
                      onPressed: () async {
                        if (pageIndex != 2) {
                          await pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastEaseInToSlowEaseOut,
                          );
                        } else {
                          /// COMPLETE ///
                          await CustomLoadingOverlay.show(
                            asyncFunction: () async {
                              await SharedPref.setIsProfileComplete(
                                completed: true,
                              );
                              await SharedPref.setIsUserLoggedIn(
                                isloggedin: true,
                              );
                              await UserServices.updateUserDocument(
                                user: UserModel(completeProfile: 1),
                              );
                              unawaited(
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.home,
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: FontSizes.headline4,
                          fontWeight: FontWeight.w500,
                          color: AppColors.scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
