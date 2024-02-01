import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  ///
  Widget textRow({
    required String title,
    required String value,
    double? titleFontSize,
    Color? titleTextColor,
    FontWeight? valueFontweight,
    double? valueFontSize,
    Color? valueTextColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CustomText(
            title,
            maxLines: 1,
            fontWeight: FontWeight.w600,
            textColor: titleTextColor ?? AppColors.textHeadlineColor,
            fontSize: titleFontSize ?? FontSizes.headline2,
          ),
          const Spacer(),
          CustomText(
            value,
            maxLines: 1,
            fontWeight: valueFontweight ?? FontWeight.w600,
            fontSize: valueFontSize ?? FontSizes.headline3,
            textColor: valueTextColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Ref : L7445',
          maxLines: 1,
          fontWeight: FontWeight.w600,
          textColor: AppColors.textHeadlineColor,
          fontSize: FontSizes.headline2,
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CustomArrowBack(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Download.
            },
            icon: Icon(
              CupertinoIcons.download_circle,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(40),
            textRow(
              title: 'Date',
              value: '12/09/2023',
            ),
            const Gap(30),
            textRow(
              title: 'État',
              value: 'Livré',
            ),
            const Gap(30),
            const Divider(),
            const Gap(30),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      dividerHeight: 0,
                      indicatorWeight: 0,
                      labelColor: AppColors.backgroundColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      splashBorderRadius: BorderRadius.circular(30),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.primaryColor,
                      ),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                      tabs: [
                        SizedBox(
                          width: width,
                          child: const Tab(
                            text: 'Recettes',
                          ),
                        ),
                        SizedBox(
                          width: width,
                          child: const Tab(
                            text: 'Ingredients',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 120,
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              textRow(
                                title: 'Salad Ofish',
                                titleFontSize: FontSizes.headline3,
                                value: '34 MAD',
                                valueFontweight: FontWeight.w500,
                              ),
                              const Gap(10),
                              textRow(
                                title: 'Pasta carbonara',
                                titleFontSize: FontSizes.headline3,
                                value: '34 MAD',
                                valueFontweight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              textRow(
                                title: 'Salad Ofish',
                                titleFontSize: FontSizes.headline3,
                                value: '34 MAD',
                                valueFontweight: FontWeight.w500,
                              ),
                              const Gap(10),
                              textRow(
                                title: 'Pasta carbonara',
                                titleFontSize: FontSizes.headline3,
                                value: '34 MAD',
                                valueFontweight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Gap(30),
            textRow(
              title: 'Total HT',
              titleFontSize: FontSizes.headline4,
              value: '57 MAD',
              valueFontSize: FontSizes.headline4,
              valueFontweight: FontWeight.w500,
              valueTextColor: AppColors.textHeadlineColor,
            ),
            const Gap(20),
            textRow(
              title: 'TVA',
              titleFontSize: FontSizes.headline4,
              titleTextColor: AppColors.textColor,
              value: '7 MAD',
              valueFontSize: FontSizes.headline4,
              valueFontweight: FontWeight.w500,
            ),
            const Gap(20),
            textRow(
              title: 'Total TTC',
              value: '64 MAD',
              valueTextColor: AppColors.textHeadlineColor,
              valueFontSize: FontSizes.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
