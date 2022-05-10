import 'package:flutter/material.dart';

import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/screen/Profile/profile.dart';

import 'signin.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/ben10.jpg'),
                ),
                Text(
                  'Amrutanshu',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: const <Widget>[
                Icon(Icons.bookmark),
                Text('Appointment'),
              ],
            ),
            onTap: () async {},
          ),
          ListTile(
            title: Row(
              children: const <Widget>[
                Icon(Icons.logout),
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
          ListTile(
            title: Row(
              children: const <Widget>[
                Icon(Icons.people),
                Text('Profile'),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Profile();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
