import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/router/router.dart';
import 'package:cookeat/modules/profile/widgets/profile_single_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(20),
          CustomText(
            'Mon compte',
            fontWeight: FontWeight.w600,
            textColor: AppColors.textHeadlineColor,
            fontSize: FontSizes.headline2,
          ),
          const Gap(30),
          CachedNetworkImage(
            imageUrl: 'https://t.ly/d0Xsi',
            imageBuilder: (context, imageProvider) => Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const SizedBox(
              width: 120,
              height: 120,
            ),
            placeholder: (context, url) => const SizedBox(
              width: 120,
              height: 120,
            ),
          ),
          const Gap(20),
          CustomText(
            'Jean-Pierre Dupont',
            fontWeight: FontWeight.w600,
            textColor: AppColors.textHeadlineColor,
            fontSize: FontSizes.headline1,
          ),
          const Gap(40),
          const ProfileSingleListTile(
            route: Routes.profileSettings,
            title: 'Parametres de compte',
            leading: 'person',
          ),
          const ProfileSingleListTile(
            route: Routes.cookeatSettings,
            title: 'Parametres KookEat',
            leading: 'cookeat',
          ),
          const ProfileSingleListTile(
            route: Routes.profileOrders,
            title: 'Mes Commandes',
            leading: 'orders',
          ),
          const ProfileSingleListTile(
            route: Routes.profileFavorites,
            title: 'Mes Favoris',
            leading: 'favorite',
          ),
        ],
      ),
    );
  }
}
