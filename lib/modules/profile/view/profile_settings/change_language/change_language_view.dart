import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:cookeat/l10n/l10n.dart';
import 'package:cookeat/l10n/locale_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ChangeLanguageView extends StatelessWidget {
  const ChangeLanguageView({super.key});

  InkWell languageOption(
    BuildContext context, {
    required String localeCode,
    required String iconName,
    required String language,
  }) {
    return InkWell(
      onTap: () async {
        if (SharedPref.getCurrentLocal().languageCode != localeCode) {
          await SharedPref.setCurrentLanguage(localeCode);
          // ignore: use_build_context_synchronously
          context.read<LocaleCubit>().changeLocale(Locale(localeCode));
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.accentColor),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              '${Constants.imagesPath}language-$iconName-icon.png',
              height: 30,
            ),
            const Gap(20),
            CustomText(
              language,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          'Languages',
          fontWeight: FontWeight.w600,
          textColor: AppColors.textHeadlineColor,
        ),
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CustomArrowBack(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Choisir votre langue',
                fontWeight: FontWeight.w600,
                textColor: AppColors.textHeadlineColor,
              ),
              const Gap(30),
              languageOption(
                context,
                localeCode: 'en',
                iconName: 'english',
                language: context.l10n.english,
              ),
              const Gap(20),
              languageOption(
                context,
                localeCode: 'fr',
                iconName: 'french',
                language: context.l10n.french,
              ),
              const Gap(20),
              languageOption(
                context,
                localeCode: 'ar',
                iconName: 'arabic',
                language: context.l10n.arabic,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
