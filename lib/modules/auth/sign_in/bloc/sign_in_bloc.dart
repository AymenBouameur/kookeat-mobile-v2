import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cookeat/core/components/custom_loading_overlay.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/router/router.dart';
import 'package:cookeat/core/services/firebase/auth/auth_services.dart';
import 'package:cookeat/core/services/firebase/auth/user_serviecs.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (event is SignInFormSubmitted) {
        await CustomLoadingOverlay.show(
          asyncFunction: () async {
            final signedIn = await AuthServices.signIn(
              email: event.email,
              password: event.password,
            );
            if (signedIn) {
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
                await SharedPref.setIsProfileComplete(completed: false);
                // GOTO : COMPLETE PROFILE.
                // When user did not finish complete profile:
                unawaited(
                  AppRouter.navigatorKey.currentState
                      ?.pushReplacementNamed(Routes.completeProfile),
                );
              }
            }
          },
        );
      }
    });
  }
}
