import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/modules/profile/view/orders/order_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Mes Commandes',
          fontWeight: FontWeight.w600,
          textColor: AppColors.textHeadlineColor,
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CustomArrowBack(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                CustomText(
                  'Filtrer par',
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.textHeadlineColor,
                ),
                const Gap(10),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 200,
                          color: AppColors.accentColor.withOpacity(0.3),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.calendar,
                                color: AppColors.accentColor,
                              ),
                              const Gap(10),
                              CustomText(
                                'Mois',
                                textColor: AppColors.accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.expand_more_rounded,
                                color: AppColors.accentColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Flexible(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 200,
                          color: AppColors.accentColor.withOpacity(0.3),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.calendar,
                                color: AppColors.accentColor,
                              ),
                              const Gap(10),
                              CustomText(
                                'Année',
                                textColor: AppColors.accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.expand_more_rounded,
                                color: AppColors.accentColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                CustomText(
                  'My Orders',
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.textHeadlineColor,
                ),
                const Gap(10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.accentColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Gap(5),
                          const CustomText(
                            '12/09/22',
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            fontWeight: FontWeight.w600,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: AppColors.accentColor,
                              ),
                            ),
                          ),
                          CustomText(
                            'Ref : L2845',
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.textHeadlineColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: AppColors.accentColor,
                              ),
                            ),
                          ),
                          const CustomText(
                            '43 MAD',
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            fontWeight: FontWeight.w600,
                          ),
                          const Spacer(),
                          const Gap(2),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<dynamic>(
                                  builder: (_) => const OrderDetailsView(),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.accentColor,
                              child: Icon(
                                Icons.visibility,
                                color: AppColors.scaffoldBackgroundColor,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
