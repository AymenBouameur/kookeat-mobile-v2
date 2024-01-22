import 'package:cookeat/core/utils/sizes.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.child,
    required this.onPressed,
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderSide,
  });

  final Widget child;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        height: height ?? 48,
        width: width ?? ScreenSizes.width * 0.7,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: borderSide ?? BorderSide.none,
            ),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
