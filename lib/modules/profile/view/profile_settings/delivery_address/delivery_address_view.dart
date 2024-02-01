import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DeliveryAddressView extends StatelessWidget {
  const DeliveryAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Adresse de livraison',
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
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        'Saisir votre adresse',
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.textHeadlineColor,
                      ),
                      const Gap(30),
                      CustomTextFormField(
                        hintText: 'Adresse',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        onChanged: (String? value) {
                          // address = value;
                        },
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        hintText: 'Adresse 2',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        onChanged: (String? value) {
                          // address2 = value;
                        },
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Flexible(
                            child: CustomTextFormField(
                              hintText: 'Code postale',
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              onChanged: (String? value) {
                                // postalCode = value;
                              },
                            ),
                          ),
                          const Gap(20),
                          Flexible(
                            child: CustomTextFormField(
                              hintText: 'Ville',
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.name,
                              onChanged: (String? value) {
                                // city = value;
                              },
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
                child: CustomElevatedButton(
                  child: CustomText(
                    'Enregistrer',
                    textColor: AppColors.scaffoldBackgroundColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
