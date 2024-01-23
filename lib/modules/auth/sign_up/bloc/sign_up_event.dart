part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpFormSubmitted extends SignUpEvent {
  const SignUpFormSubmitted({
    required this.fullName,
    required this.email,
    required this.password,
    required this.isAgreedToTerms,
  });

  final String fullName;
  final String email;
  final String password;
  final bool isAgreedToTerms;

  @override
  List<Object> get props => [email, password];
}
