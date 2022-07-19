import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:tnshealth/API/userAPI.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginTextChanged>((event, emit) {
      //EmailValidator
      if (event.emailValue.isEmpty) {
        emit(LoginError('Please Enter Your Email id'));
      } else if (!(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z]+\.[a-zA-Z]+"))
          .hasMatch(event.emailValue)) {
        emit(LoginError('Please Enter a valid email'));
      }
      //password validator
      else if (event.passwordValue.isEmpty) {
        emit(LoginError('Please Enter a Password'));
      } else if (!RegExp(r'^.{6,}$').hasMatch(event.passwordValue)) {
        emit(LoginError('Please Enter Correct Password of Min. 6 digit'));
      } else {
        emit(LoginValid());
      }
    });
    on<LoginButton>((event, emit) => {
          UserAPI().signIn(event.email, event.password),
          emit(LoginSuccefull()),
        });
  }
}
