import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tnshealth/API/firestore.dart';

const kprofiletext = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

class Profile extends StatefulWidget {
  Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String email = '';
  String phonenum = '';
  String adress = '';
  String bloodgroup = '';
  String gender = '';
  String height = '';
  String weight = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blue,
        actions: const <Widget>[
          // IconButton(
          //   icon: const Icon(
          //     Icons.edit,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     Navigator.push(context, MaterialPageRoute(
          //       builder: (context) {
          //         return EditProfile();
          //       },
          //     ));
          //   },
          // )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: currentData(),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: $name', style: kprofiletext),
                    Text('Mobile Number: $phonenum', style: kprofiletext),
                    Text('Email Id: $email', style: kprofiletext),
                    Text('Adress:$adress', style: kprofiletext),
                    Text('Blood Group: $bloodgroup', style: kprofiletext),
                    Text('Gender :$gender', style: kprofiletext),
                    Text('Height: $height', style: kprofiletext),
                    Text('Weight: $weight', style: kprofiletext),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  currentData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    FirestoreData firestore = FirestoreData(uid: uid);
    final names = await firestore.getCurrentUserData();
    if (names != null) {
      name = names[0];
      email = names[1];
      phonenum = names[2];
      adress = names[3];
      bloodgroup = names[4];
      gender = names[5];
      height = names[6];
      weight = names[7];

      print('**************name = $name***********');
      print('**********email = $email');
      print('******************adress = $adress');
      print('******************phonenum = $phonenum');
      print('******************bloodgroup = $bloodgroup');
      print('******************gender = $gender');
      print('******************height = $height');
      print('******************weight = $weight');
    } else {
      print('names = null************$uid***********');
    }
  }
}
