import 'package:flutter/material.dart';

import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/model/usermodel.dart';
import 'package:tnshealth/screen/Dashboard.dart';

import 'package:tnshealth/screen/signup.dart';

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

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const logo = CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage('images/logo.png'),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter yor Email";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
      },
      onSaved: (value) {
        value = emailController.text;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    //password field
    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passswordController,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Please Enter your Password";
        }
        if (!regex.hasMatch(value)) {
          return "Please Enter Correct Password of 6 digit";
        }
      },
      onSaved: (value) {
        value = passswordController.text;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
    final loginbutton = Material(
      color: Colors.redAccent,
      elevation: 5,
      borderRadius: BorderRadius.circular(18),
      child: MaterialButton(
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            _loggedInUser = await userAPI().signIn(
                emailController.text.trim(), passswordController.text.trim());

            if (_loggedInUser != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashBoard(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  elevation: 6,
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    'Please check your Email/Password',
                  ),
                ),
              );
            }
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
      ),
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
                      logo,
                      const SizedBox(height: 5),
                      const Text(
                        'TNS Health',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      emailField,
                      const SizedBox(height: 20),
                      passwordField,
                      const SizedBox(height: 20),
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
