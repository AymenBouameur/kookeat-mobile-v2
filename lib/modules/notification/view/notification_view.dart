import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Gap(20),
          CustomText(
            'Notifications',
            fontWeight: FontWeight.w600,
            textColor: AppColors.textHeadlineColor,
            fontSize: FontSizes.headline2,
          ),
          const Gap(30),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.cardColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                '${Constants.vectorsPath}app-logo.svg',
                                height: 35,
                              ),
                              Flexible(
                                child: CustomText(
                                  'Kookeat assistant',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSizes.headline4,
                                  textColor: AppColors.textHeadlineColor,
                                ),
                              ),
                              const Gap(1),
                              const Gap(1),
                              const Gap(1),
                              const Flexible(
                                child: CustomText(
                                  "Aujourd'hui 16:21",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: FontSizes.headline5,
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          CustomText(
                            // ignore: lines_longer_than_80_chars
                            'Lorem ipsum dolor sit amet, consectetur set adipiscing elit, sed do eiusmod tempor',
                            textColor:
                                AppColors.textHeadlineColor.withOpacity(0.9),
                            fontSize: FontSizes.headline4,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
