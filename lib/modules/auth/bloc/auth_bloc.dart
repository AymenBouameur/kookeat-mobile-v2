import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cookeat/core/components/components.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/data/models/user_model.dart';
import 'package:cookeat/core/router/router.dart';
import 'package:cookeat/core/services/firebase/auth/social_auth_services.dart';
import 'package:cookeat/core/services/firebase/auth/user_serviecs.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      await CustomLoadingOverlay.show(
        asyncFunction: () async {
          late UserCredential? userCredential;

          if (event is AuthWithGoogleEvent) {
            await GoogleSignIn().signOut();

            /// Google
            userCredential = await SocialAuthServices.signInWithGoogle();
          } else if (event is AuthWithAppleEvent) {
            /// Apple
            userCredential = await SocialAuthServices.signInWithApple();
          } else if (event is AuthWithFacebookEvent) {
            /// Facebook
            userCredential = await SocialAuthServices.signInWithApple();
          }
          if (userCredential != null) {
            final isNewUser =
                userCredential.additionalUserInfo?.isNewUser != null &&
                    (userCredential.additionalUserInfo?.isNewUser ?? true);

            if (isNewUser) {
              // Create user document;
              final created = await UserServices.createUserDocument(
                userId: userCredential.user?.uid ?? '',
                user: UserModel(
                  uid: userCredential.user?.uid,
                  firstName: userCredential.user?.displayName,
                  emailAddress: userCredential.user?.email,
                  completeProfile: 0,
                ),
              );
              // When document created then:
              if (created) {
                await SharedPref.setCompleteProfile(completeProfile: false);

                unawaited(
                  AppRouter.navigatorKey.currentState
                      ?.pushReplacementNamed(Routes.completeProfile),
                );
              }
            } else {
              // Get user document:
              final user = await UserServices.getCurrentUserDocument();

              if (user != null && user.completeProfile == 1) {
                await SharedPref.setIsUserLoggedIn(isloggedin: true);

                // GOTO : HOME
                unawaited(
                  AppRouter.navigatorKey.currentState?.pushReplacementNamed(
                    Routes.home,
                  ),
                );
                // TODO(MAH): Store document user.
              } else {
                await SharedPref.setCompleteProfile(completeProfile: false);
                // GOTO : COMPLETE PROFILE.
                // When user did not finish complete profile:
                unawaited(
                  AppRouter.navigatorKey.currentState
                      ?.pushReplacementNamed(Routes.completeProfile),
                );
              }
            }
          } else {
            CustomSnackBar.showSnackBar(
              text: 'Something went wrong',
              isError: true,
            );
          }
        },
      );
    });
  }
}
