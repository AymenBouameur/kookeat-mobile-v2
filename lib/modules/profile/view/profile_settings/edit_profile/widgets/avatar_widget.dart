import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/modules/profile/view/profile_settings/edit_profile/edit_profile_cubits/avatar_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // GOTO AVATAR VIEW.
      },
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.dividerColor,
          ),
        ),
        child: BlocBuilder<AvatarCubit, File?>(
          builder: (_, state) {
            final file = context.watch<AvatarCubit>().image;
            if (file != null) {
              return Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.scaffoldBackgroundColor,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: FileImage(file),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              return CachedNetworkImage(
                imageUrl: 'https://t.ly/d0Xsi', // USER AVATAR
                imageBuilder: (context, imageProvider) => Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.scaffoldBackgroundColor,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const SizedBox(
                  width: 130,
                  height: 130,
                ),
                errorWidget: (context, url, e) => const SizedBox(
                  width: 130,
                  height: 130,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
