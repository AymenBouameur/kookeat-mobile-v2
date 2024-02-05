import 'package:cookeat/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Future<dynamic> customModalBottomSheet(
  BuildContext context, {
  required Widget widget,
  double? height,
  Color? backgroundColor,
}) {
  return showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    backgroundColor: backgroundColor ?? AppColors.backgroundColor,
    builder: (context) => RepaintBoundary(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        // When the keyboard shows the bottom sheet should not be hidden.
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(10),
              Container(
                height: 5,
                width: MediaQuery.sizeOf(context).width * 0.25,
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0XFFDCDCDC),
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: widget,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
