import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:tnshealth/screen/Dashboard.dart';
import 'package:tnshealth/screen/signup.dart';

const users = {
  'amrutanshup@gmail.com': 'tns',
  // 'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var _navContext;

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> signuppage(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    Navigator.push(_navContext, MaterialPageRoute(
      builder: (context) {
        return SignupPage();
      },
    ));
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    _navContext = context;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: FlutterLogin(
        title: 'TNS-Health',
        logo: const AssetImage('images/circle.jpg'),
        onLogin: _authUser,
        onSignup: signuppage,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => DashBoard(),
          ));
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }
}
