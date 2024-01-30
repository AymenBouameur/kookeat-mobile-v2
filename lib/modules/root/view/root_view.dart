import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/custom_bottom_app_bar.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:cookeat/modules/cart/view/cart_view.dart';
import 'package:cookeat/modules/catalog/view/catalog_view.dart';
import 'package:cookeat/modules/home/view/home_view.dart';
import 'package:cookeat/modules/notification/view/notification_view.dart';
import 'package:cookeat/modules/profile/view/profile_view.dart';
import 'package:cookeat/modules/root/cubit/bottom_app_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});
  static final pageController = PageController();

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomAppBarCubit(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.all(5),
          child: Builder(
            builder: (context) {
              return FloatingActionButton(
                onPressed: () {
                  RootView.pageController.jumpToPage(2);
                  context.read<BottomAppBarCubit>().changePageIndex(2);
                },
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  '${Constants.vectorsPath}home-chef-icon.svg',
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: BlocBuilder<BottomAppBarCubit, int>(
          builder: (context, state) {
            return PageView(
              controller: RootView.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomeView(),
                CartView(),
                CatalogView(),
                NotificationView(),
                ProfileView(),
              ],
            );
          },
        ),
      ),
    );
  }
}
