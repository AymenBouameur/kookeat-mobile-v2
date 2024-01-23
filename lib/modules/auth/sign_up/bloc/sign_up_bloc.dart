import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      if (event is SignUpFormSubmitted) {
        // if terms are not accepted:
        if (!event.isAgreedToTerms) {
          //
          emit(SignUpFailed());
        } else {
          emit(SignUpSuccess());
        }
      } else {
        emit(SignUpFailed());
      }
    });
  }
}
