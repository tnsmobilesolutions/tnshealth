import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
      home: SignIn(),
    );
  }
}
