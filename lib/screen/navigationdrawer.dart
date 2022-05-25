import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/screen/Profile/my_orders.dart';
import 'package:tnshealth/screen/Profile/profile.dart';

import '../API/firestoreAPI.dart';
import 'signin.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String name = '';

  currentData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    FirestoreData firestore = FirestoreData(uid: uid);
    final names = await firestore.getCurrentUserData();
    if (names != null) {
      name = names[0];
    } else {}
    // return name;
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
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MyOrders();
                      },
                    ),
                  );
                  print(await userAPI().getDocumentID());
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
                        return const Profile();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: const <Widget>[
                    Icon(Icons.logout),
                    SizedBox(width: 5),
                    Text('Logout'),
                  ],
                ),
                onTap: () async {
                  await userAPI().logout();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SignIn();
                    },
                  ));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
