import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/bloc/login_bloc/login_bloc.dart';
import 'package:tnshealth/model/usermodel.dart';
import 'package:tnshealth/screen/Dashboard.dart';
import 'package:tnshealth/screen/login%20page/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
// firebase implementation

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passswordController = TextEditingController();
  AppUser? _loggedInUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          autofocus: false,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) {
            value = emailController.text;
          },
          onChanged: (val) {
            BlocProvider.of<LoginBloc>(context).add(LoginTextChanged(
                emailValue: emailController.text,
                passwordValue: passswordController.text));
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Email',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        );
      },
    );

    //password field
    final passwordField = BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          autofocus: false,
          controller: passswordController,
          keyboardType: TextInputType.visiblePassword,
          onSaved: (value) {
            value = passswordController.text;
          },
          onChanged: (val) {
            BlocProvider.of<LoginBloc>(context).add(LoginTextChanged(
                passwordValue: passswordController.text,
                emailValue: emailController.text));
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.vpn_key),
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        );
      },
    );
    //LogInButton

    final loginbutton = BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: (state is LoginValid) ? Colors.blue : Colors.grey,
          onPressed: () async {
            try {
              if (_formkey.currentState!.validate()) {
                BlocProvider.of<LoginBloc>(context).add(LoginButton(
                    email: emailController.text,
                    password: passswordController.text));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  elevation: 6,
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    'Please check your Email/Password',
                  ),
                ));
              }
            } catch (e) {
              print(e);
            }
          },
          child: const Text(
            'SignIn',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          padding: const EdgeInsets.all(8),
          minWidth: MediaQuery.of(context).size.width,
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        image: AssetImage('images/logo.png'),
                      ),
                      // const SizedBox(height: 5),
                      // const Text(
                      //   'TNS Health',
                      //   style: TextStyle(
                      //       fontSize: 30, fontWeight: FontWeight.bold),
                      // ),
                      // const SizedBox(height: 20),
                      emailField,
                      const SizedBox(height: 20),
                      passwordField,
                      const SizedBox(height: 20),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginError) {
                            return Text(
                              state.errorMessage,
                              style: const TextStyle(color: Colors.red),
                            );
                          }
                          return Container();
                        },
                      ),
                      loginbutton,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text('Don\'t have an account?'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage()));
                              },
                              child: const Text('SignUp',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )))
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
