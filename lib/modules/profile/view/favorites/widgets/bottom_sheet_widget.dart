import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomsheetWidget extends StatelessWidget {
  const BottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //
    var currentRangeValues = const RangeValues(40, 90);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        CustomText(
          'Category',
          fontSize: FontSizes.headline4,
          fontWeight: FontWeight.bold,
          textColor: AppColors.textHeadlineColor,
        ),
        const Gap(10),
        SizedBox(
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                height: 40,
                width: 130,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CustomText(
                    'Breakfast',
                    maxLines: 1,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSizes.headline4,
                    textColor: AppColors.textHeadlineColor,
                  ),
                ),
              );
            },
          ),
        ),
        const Gap(20),
        CustomText(
          'Gastronomie',
          fontSize: FontSizes.headline4,
          fontWeight: FontWeight.bold,
          textColor: AppColors.textHeadlineColor,
        ),
        const Gap(10),
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 80,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackgroundColor,
                  border: Border.all(
                    color: AppColors.accentColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://img.freepik.com/vecteurs-libre/illustration-du-drapeau-france_53876-27099.jpg?size=626&ext=jpg&ga=GA1.1.1788068356.1707004800&semt=ais',
                      imageBuilder: (context, imageProvider) => Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const SizedBox(
                        height: 100,
                      ),
                      errorWidget: (context, url, error) => const SizedBox(
                        height: 100,
                      ),
                    ),
                    const Gap(5),
                    Center(
                      child: CustomText(
                        'Française',
                        maxLines: 1,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.textHeadlineColor,
                        fontSize: FontSizes.headline5,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Gap(20),
        CustomText(
          'Price Range',
          fontSize: FontSizes.headline4,
          fontWeight: FontWeight.bold,
          textColor: AppColors.textHeadlineColor,
        ),
        const Gap(10),
        StatefulBuilder(
          builder: (context, setstate) {
            return RangeSlider(
              min: 20,
              max: 90,
              divisions: 7,
              values: currentRangeValues,
              labels: RangeLabels(
                currentRangeValues.start.round().toString(),
                currentRangeValues.end.round().toString(),
              ),
              onChanged: (values) {
                setstate(() {
                  currentRangeValues = values;
                });
              },
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              CustomText(
                '20 Dh',
                fontWeight: FontWeight.w600,
                fontSize: FontSizes.headline4,
              ),
              Spacer(),
              CustomText(
                '90 Dh',
                fontWeight: FontWeight.w600,
                fontSize: FontSizes.headline4,
              ),
            ],
          ),
        ),
        const Gap(40),
        Row(
          children: [
            Flexible(
              child: CustomElevatedButton(
                backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                onPressed: () {
                  // reset
                },
                child: CustomText(
                  'Reset',
                  textColor: AppColors.textHeadlineColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Gap(10),
            Flexible(
              child: CustomElevatedButton(
                onPressed: () {
                  // apply
                },
                child: CustomText(
                  'Apply',
                  textColor: AppColors.scaffoldBackgroundColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const Gap(30),
      ],
    );
  }
}
