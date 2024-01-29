import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cookeat/core/components/custom_loading_overlay.dart';
import 'package:cookeat/core/data/local/shred_pref.dart';
import 'package:cookeat/core/router/router.dart';
import 'package:cookeat/core/services/firebase/auth/auth_services.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpFormSubmitted && event.isAgreedToTerms) {
        await CustomLoadingOverlay.show(
          asyncFunction: () async {
            final signedIn = await AuthServices.signUp(
              email: event.email,
              password: event.password,
              fullName: event.fullName,
            );

            if (signedIn) {
              await SharedPref.setIsProfileComplete(completed: false);
              unawaited(
                AppRouter.navigatorKey.currentState?.pushReplacementNamed(
                  Routes.completeProfile,
                ),
              );
              emit(SignUpSuccess());
            } else {
              emit(SignUpFailed());
            }
          },
        );
      } else {
        emit(SignUpFailed());
      }
    });
  }
}
