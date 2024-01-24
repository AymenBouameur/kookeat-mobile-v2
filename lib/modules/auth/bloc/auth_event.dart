part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthWithGoogleEvent extends AuthEvent {}

class AuthWithAppleEvent extends AuthEvent {}

class AuthWithFacebookEvent extends AuthEvent {}
