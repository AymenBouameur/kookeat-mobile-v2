import 'package:cookeat/config/theme/theme.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/utils/utils.dart';
import 'package:cookeat/modules/profile/view/profile_settings/edit_profile/edit_profile_cubits/avatar_cubit.dart';
import 'package:cookeat/modules/profile/view/profile_settings/edit_profile/widgets/avatar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(20),
                      // AVATAR
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: BlocProvider(
                          create: (_) => AvatarCubit(),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              const AvatarWidget(),
                              // Pen
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Builder(
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () async {
                                        final imageFile =
                                            await FilesUtils.uploadAvatarFile();
                                        if (imageFile != null) {
                                          // ignore: use_build_context_synchronously
                                          context
                                              .read<AvatarCubit>()
                                              .changeAvatar(
                                                imageFile,
                                              );
                                        }
                                      },
                                      child: Container(
                                        width: 33,
                                        height: 33,
                                        margin: const EdgeInsets.only(
                                          bottom: 5,
                                          right: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primaryColor,
                                          border: Border.all(
                                            color: AppColors.backgroundColor,
                                            width: 2,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            CupertinoIcons.pen,
                                            color: AppColors
                                                .scaffoldBackgroundColor,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(50),
                      //
                      CustomTextFormField(
                        hintText: 'Nom complet',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        onChanged: (String? value) {
                          if (value != null) {
                            // controller.responsableName = value.trim();
                          }
                        },
                        validator: (String? value) {
                          if (value!.length < 2) {
                            return 'Trop court.';
                          }
                          return null;
                        },
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        hintText: 'E-mail',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String? value) {
                          if (FormUtils.isEmail(value!.trim())) {
                            // email = value.trim();
                          }
                        },
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email.';
                          } else if (!FormUtils.isEmail(value.trim())) {
                            return 'Please enter a valid email.';
                          }
                          return null;
                        },
                      ),
                      const Gap(20),
                      CustomTextFormField(
                        hintText: 'Téléphone',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        onChanged: (String? value) {
                          if (FormUtils.isPhoneNumber(value!.trim())) {
                            // email = value.trim();
                          }
                        },
                        validator: (String? value) {
                          if ((value?.isNotEmpty ?? false) &&
                              !FormUtils.isPhoneNumber(value!)) {
                            // ignore: lines_longer_than_80_chars
                            return 'Veuillez saisir un numéro de téléphone valide';
                          }
                          return null;
                        },
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                  child: CustomText(
                    'Enregistrer',
                    textColor: AppColors.scaffoldBackgroundColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
