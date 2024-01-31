import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileSingleListTile extends StatelessWidget {
  const ProfileSingleListTile({
    required this.route,
    required this.title,
    required this.leading,
    super.key,
  });
  final String route;
  final String title;
  final String leading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: AppColors.primaryColor.withOpacity(0.1),
        title: CustomText(
          title,
          textColor: AppColors.textHeadlineColor,
        ),
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryColor.withOpacity(0.7),
          child: Image.asset(
            '${Constants.imagesPath}profile-$leading-icon.png',
            height: 20,
          ),
        ),
      ),
    );
  }
}
