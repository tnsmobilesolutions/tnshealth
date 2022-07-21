// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthshared/models/order_model.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tnshealth/API/orderAPI.dart';

import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/bloc/profile/profile_bloc.dart';
import 'package:tnshealth/screen/Profile/my_orders.dart';
import 'package:tnshealth/screen/Profile/profile.dart';
import 'package:tnshealth/screen/login%20page/signin.dart';

import '../API/firestoreAPI.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String? name;

  currentData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    FirestoreData firestore = FirestoreData(uid: uid);
    final names = await firestore.getCurrentUserData();
    if (names != null) {
      name = names.name;
    } else {}
    return name;
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Center(child: Text('Sign Out')),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Center(child: Text('Do you want to sign out ?')),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () async {
                    await UserAPI().logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        elevation: 6,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'You are Logged Out',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currentData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/ben10.jpg'),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        '$name ',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.bookmark),
                    SizedBox(width: 5),
                    Text('Appointment'),
                  ],
                ),
                onTap: () async {},
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.collections_bookmark_rounded),
                    SizedBox(width: 5),
                    Text('My Orders'),
                  ],
                ),
                onTap: () async {
                  List<Order>? myOrders = await OrdersAPI().fetchMyOrders();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyOrders(myAllOrders: myOrders);
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.people),
                    SizedBox(width: 5),
                    Text('Profile'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Profile(address: []);
                      },
                    ),
                  );
                },
              ),
              ListTile(
                  title: Row(
                    children: const <Widget>[
                      Icon(Icons.details),
                      SizedBox(width: 5),
                      Text('Order Status'),
                    ],
                  ),
                  onTap: (() {
                    MaterialPageRoute(builder: (context) => TimelineTile());
                  })),
              ListTile(
                  title: Row(
                    children: const <Widget>[
                      Icon(Icons.logout),
                      SizedBox(width: 5),
                      Text('Log Out'),
                    ],
                  ),
                  onTap: showMyDialog),
            ],
          ),
        );
      },
    );
  }
}
