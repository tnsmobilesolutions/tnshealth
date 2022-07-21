import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/bloc/internet_connectivity/internet_connectivity_bloc.dart';
import 'package:tnshealth/bloc/login_bloc/login_bloc.dart';
import 'package:tnshealth/bloc/profile/profile_bloc.dart';
import 'package:tnshealth/model/usermodel.dart';
import 'package:tnshealth/screen/Dashboard.dart';
import 'package:tnshealth/screen/login%20page/signin.dart';

import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Tnshealth());
}

class Tnshealth extends StatelessWidget {
  const Tnshealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'TNS Health',
        theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AnimatedSplashScreen(
            splash: const Image(
              image: AssetImage('images/logo.png'),
            ),
            splashIconSize: 200,
            splashTransition: SplashTransition.scaleTransition,
            nextScreen: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final user = snapshot.data;

                  if (user == null) {
                    return const SignIn();
                  } else {
                    return FutureBuilder<AppUser?>(
                      future: UserAPI().getAppUserFromUid(user.uid),
                      builder: (_, snap) {
                        if (snap.hasData) {
                          return BlocListener<InternetBloc, InternetState>(
                            listener: (context, state) {
                              if (state is InternetGainState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Internet is Connected'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else if (state is InternetLossState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(days: 365),
                                    action: SnackBarAction(
                                      label: 'Dismiss',
                                      disabledTextColor: Colors.white,
                                      textColor: Colors.white,
                                      onPressed: () {
                                        //Do whnaciatever you want
                                      },
                                    ),
                                    content:
                                        const Text('Internet is Not Connected'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            },
                            child: const DashBoard(),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  }
                } else {
                  return const SignIn();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
