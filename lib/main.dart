import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/model/usermodel.dart';
import 'package:tnshealth/screen/Dashboard.dart';
import 'package:tnshealth/screen/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Tnshealth());
}

class Tnshealth extends StatelessWidget {
  const Tnshealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TNS Health',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedSplashScreen(
          splash: const Image(
            image: AssetImage('images/logo.png'),
          ),
          splashIconSize: 200,
          splashTransition: SplashTransition.rotationTransition,
          nextScreen: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final user = snapshot.data;

                if (user == null) {
                  return const SignIn();
                } else {
                  return FutureBuilder<AppUser?>(
                    future: userAPI().getAppUserFromUid(user.uid),
                    builder: (_, snap) {
                      if (snap.hasData) {
                        return const DashBoard();
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                }
              } else {
                return SignIn();
              }
            },
          ),
        ),
      ),
    );
  }
}
