part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValid extends LoginState {}

class LoginSuccefull extends LoginState {}

class LoginUnSuccefull extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);
}

class LoginLoading extends LoginState {}
