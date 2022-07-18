part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginTextChanged extends LoginEvent {
  final String emailValue;
  final String passwordValue;
  LoginTextChanged({
    required this.passwordValue,
    required this.emailValue,
  });
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
  LoginSubmitted({
    required this.email,
    required this.password,
  });
}
