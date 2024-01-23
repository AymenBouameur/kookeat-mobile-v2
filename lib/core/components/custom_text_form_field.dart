import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.readOnly,
    this.height,
    this.width,
    this.hintText,
    this.initialValue,
    this.obscureText,
    this.maxLines,
    this.keyboardType,
    this.textInputAction,
    this.textController,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.onTap,
    this.inputFormatters,
    this.prefixIcon,
  });

  final bool? readOnly;
  final double? height;
  final double? width;
  final String? initialValue;
  final String? hintText;
  final bool? obscureText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? suffixIconOnTap;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? ScreenSizes.width * 0.8,
      height: height,
      child: RepaintBoundary(
        child: TextFormField(
          key: key,
          controller: textController,
          onTap: onTap,
          readOnly: readOnly ?? false,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText ?? false,
          maxLines: maxLines ?? 1,
          validator: validator,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          style: const TextStyle(
            fontSize: FontSizes.headline4,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: maxLines != null
                ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                : null,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon == null
                ? null
                : IconButton(
                    splashRadius: 20,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    color: AppColors.textColor,
                    splashColor: AppColors.accentColor.withOpacity(0.3),
                    onPressed: suffixIconOnTap,
                    icon: suffixIcon ?? const SizedBox(),
                  ),
          ),
        ),
      ),
    );
  }
}
