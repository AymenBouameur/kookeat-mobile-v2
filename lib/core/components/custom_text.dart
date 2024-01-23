import 'package:cookeat/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.textColor,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.fontsize,
    this.fontWeight,
  });

  final String text;
  final Color? textColor;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontsize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor ?? AppColors.textColor,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
