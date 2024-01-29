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
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final Color? textColor;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSize;
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
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
