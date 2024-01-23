import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/config/theme/app_font_sizes.dart';
import 'package:cookeat/core/components/custom_elevated_button.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/router/routes.dart';
import 'package:cookeat/modules/onboard/view/on_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final pageController = PageController();
  int pageIndex = 0;
  List<String> titles = [
    'Choose your meal plan budget',
    'Personalizing Your CookEat Experience',
    'Unlocking the Flavors of CookEat',
  ];

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 470,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    itemCount: 3,
                    onPageChanged: (value) {
                      setState(() {
                        pageIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnBoardScreen(
                        image: 'on-board-01',
                        text: titles[index],
                      );
                    },
                  ),
                ),
                const Gap(5),
                SizedBox(
                  height: 10,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 10,
                        width: 10,
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex == index
                              ? AppColors.primaryColor
                              : AppColors.primaryColor.withOpacity(0.2),
                        ),
                      );
                    },
                  ),
                ),
                const Gap(10),
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
                            //
                            await SharedPref.setOnBoardingPassed(
                              isPassed: true,
                            );
                            // ignore: use_build_context_synchronously
                            await Navigator.pushNamed(context, Routes.auth);
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
      ),
    );
  }
}
