import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Information personnelle',
          fontWeight: FontWeight.w600,
          textColor: AppColors.textHeadlineColor,
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CustomArrowBack(),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: CustomText('Information personnelle'),
        ),
      ),
    );
  }
}
