import 'package:flutter/material.dart';
import 'package:tnshealth/screen/Profile/editprofile.dart';

const kprofiletext = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

class Profile extends StatefulWidget {
  Profile(
      {Key? key,
      this.fullname,
      this.age,
      this.emailid,
      this.password,
      this.phonenum})
      : super(key: key);
  String? fullname, age, emailid, phonenum, password;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const EditProfile();
                },
              ));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/ben10.jpg'),
              ),
            ),
            Text('Name: ${widget.fullname}', style: kprofiletext),
            Text('Age :${widget.age}', style: kprofiletext),
            Text('Email-Id: ${widget.emailid}', style: kprofiletext),
            Text('Mobile Number: ${widget.phonenum}', style: kprofiletext),
            Text('Password: ${widget.password}', style: kprofiletext),
          ],
        ),
      ),
    );
  }
}
