import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:cookeat/modules/profile/view/favorites/widgets/bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Mes Favorits',
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
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              // Search
              RepaintBoundary(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.11),
                        blurRadius: 7,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: CustomTextFormField(
                    hintText: 'Search...',
                    borderColor: Colors.transparent,
                    fillColor: AppColors.cardColor,
                    suffixIcon: const Icon(
                      CupertinoIcons.slider_horizontal_3,
                    ),
                    suffixIconOnTap: () {
                      customModalBottomSheet(
                        context,
                        widget: const BottomsheetWidget(),
                      );
                    },
                    prefixIcon: Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.search,
                        color: AppColors.scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              //
              const Gap(20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 8,
                  ),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(
                          color: AppColors.accentColor,
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad.jpg',
                            imageBuilder: (context, imageProvider) => Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          AppColors.scaffoldBackgroundColor,
                                      child: Icon(
                                        CupertinoIcons.heart,
                                        color: AppColors.accentColor,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) => const SizedBox(
                              height: 100,
                            ),
                            errorWidget: (context, url, error) =>
                                const SizedBox(
                              height: 100,
                            ),
                          ),
                          const Gap(10),
                          CustomText(
                            'Healthy Taco Salad',
                            maxLines: 2,
                            fontSize: FontSizes.headline4,
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.textHeadlineColor,
                          ),
                          const Gap(10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CustomText(
                                '35 MAD',
                                fontSize: FontSizes.headline4,
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  // Add to cart.
                                },
                                child: CircleAvatar(
                                  radius: 19,
                                  backgroundColor: AppColors.accentColor,
                                  child: SvgPicture.asset(
                                    '${Constants.vectorsPath}cart-icon.svg',
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
