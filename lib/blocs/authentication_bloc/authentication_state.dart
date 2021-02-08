part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationState {}

class SuccesAuthentication extends AuthenticationState {}

class FailureAuthentication extends AuthenticationState {}
