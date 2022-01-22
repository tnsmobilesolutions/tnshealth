import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tnshealth/screen/Profile/editprofile.dart';

const kprofiletext = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

class Profile extends StatefulWidget {
  Profile(
      {Key? key,
      this.name,
      this.gender,
      this.emailid,
      this.dateofbirth,
      this.bloodgroup,
      this.maritial,
      this.height,
      this.weight,
      this.adress,
      this.phonenum})
      : super(key: key);
  String? name,
      gender,
      emailid,
      phonenum,
      dateofbirth,
      bloodgroup,
      maritial,
      height,
      weight,
      adress;

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
                radius: 50.0,
                backgroundImage: AssetImage('images/ben10.jpg'),
              ),
            ),
            Text('Name: ${widget.name}', style: kprofiletext),
            Text('Mobile Number: ${widget.phonenum}', style: kprofiletext),
            Text('Email Id: ${widget.emailid}', style: kprofiletext),
            Text('Gender :${widget.gender}', style: kprofiletext),
            Text('Date of Birth: ${widget.dateofbirth}', style: kprofiletext),
            Text('Blood Group: ${widget.bloodgroup}', style: kprofiletext),
            Text('Height: ${widget.height}cm', style: kprofiletext),
            Text('Weight: ${widget.weight}Kg', style: kprofiletext),
            Text('Adress: ${widget.adress}', style: kprofiletext),
          ],
        ),
      ),
    );
  }
}
