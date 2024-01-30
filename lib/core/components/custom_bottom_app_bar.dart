import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:cookeat/modules/root/cubit/bottom_app_bar_cubit.dart';
import 'package:cookeat/modules/root/view/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.15),
            spreadRadius: 7,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          color: AppColors.backgroundColor,
          shadowColor: AppColors.textColor,
          elevation: 0,
          child: BlocBuilder<BottomAppBarCubit, int>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomNavBarItem(
                    0,
                    'home',
                    'Home',
                    context,
                  ),
                  _buildBottomNavBarItem(
                    1,
                    'cart',
                    'Cart',
                    context,
                  ),
                  const Gap(40),
                  _buildBottomNavBarItem(
                    3,
                    'notification',
                    'Notification',
                    context,
                  ),
                  _buildBottomNavBarItem(
                    4,
                    'profile',
                    'Profile',
                    context,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Single item:
  Widget _buildBottomNavBarItem(
    int index,
    String iconPrefix,
    String label,
    BuildContext context,
  ) {
    final isSelected = context.watch<BottomAppBarCubit>().pageIndex == index;

    return InkWell(
      onTap: () {
        RootView.pageController.jumpToPage(index);
        context.read<BottomAppBarCubit>().changePageIndex(index);
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(
          // ignore: lines_longer_than_80_chars
          '${Constants.vectorsPath}home-$iconPrefix-${isSelected ? 'selected-' : ''}icon.svg',
          height: 22,
          width: 22,
        ),
      ),
    );
  }
}
