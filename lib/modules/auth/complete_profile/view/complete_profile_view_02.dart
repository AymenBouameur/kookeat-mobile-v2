import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CompleteProfileView02 extends StatelessWidget {
  const CompleteProfileView02({super.key});

  @override
  Widget build(BuildContext context) {
    final iconsTitles = [
      'Coriandre',
      'Fromage',
      'Tofu',
      'Oeuf',
      'Soja',
      'Poissons',
    ];

    //
    final selectedItems = <int>[];

    return Column(
      children: [
        CustomText(
          'Ingredients to exclude',
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          textColor: AppColors.textHeadlineColor,
          fontsize: FontSizes.headline1,
        ),
        const Gap(45),
        Wrap(
          spacing: 10,
          runSpacing: 25,
          children: [
            for (var i = 0; i < iconsTitles.length; i++)
              SizedBox(
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(
                      builder: (context) {
                        var selected = false;

                        return StatefulBuilder(
                          builder: (context, setstate) {
                            return GestureDetector(
                              onTap: () {
                                setstate(() {
                                  if (selectedItems.contains(i + 1)) {
                                    selectedItems.removeWhere(
                                      (element) => element == (i + 1),
                                    );
                                  } else {
                                    selectedItems.add(i + 1);
                                  }

                                  selected = !selected;
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: selected
                                      ? AppColors.primaryColor.withOpacity(0.2)
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.textColor,
                                  ),
                                ),
                                child: Image.asset(
                                  // ignore: lines_longer_than_80_chars
                                  '${Constants.iconsPath}complete-profile-${i + 9}.png',
                                  height: 40,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const Gap(5),
                    CustomText(
                      iconsTitles[i],
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
