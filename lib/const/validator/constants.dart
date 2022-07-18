import 'package:flutter/material.dart';

//Color darkblue = const Color.fromARGB(255, 186, 210, 255);

const kCircle80 =
    CircleAvatar(radius: 80, backgroundImage: AssetImage('images/ben10.jpg'));
const kCircle20 =
    CircleAvatar(radius: 20, backgroundImage: AssetImage('images/ben10.jpg'));

final kIdContainer = Container(
    width: 300,
    height: 50,
    color: Colors.tealAccent,
    child: const Text(
      'Email-Id/Mob No.',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    padding: const EdgeInsets.all(15));

final kPasswordContainer = Container(
  width: 300,
  height: 50,
  color: Colors.tealAccent,
  child: const Text(
    'Password',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
  padding: const EdgeInsets.all(15),
);

final kSignContainer = Container(
  width: 200,
  height: 50,
  color: Colors.tealAccent,
  margin: const EdgeInsets.only(bottom: 100),
  child: const Text(
    'Sign in',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
  padding: const EdgeInsets.all(15),
);

//button

final kbuttonshape = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.red))));
