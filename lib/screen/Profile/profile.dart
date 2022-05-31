import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tnshealth/API/firestoreAPI.dart';
import 'package:tnshealth/model/addressmodel.dart';
import 'package:tnshealth/model/usermodel.dart';
import 'package:tnshealth/screen/Profile/editprofile.dart';
import 'package:tnshealth/screen/Profile/userAddress.dart';
import 'package:tnshealth/widget.dart';

const kprofiletext = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AppUser? userDetails = AppUser(
    name: 'Atanu',
    phonenumber: '7008183804',
    email: 'jena.atanusabyasachi@gmail.com',
    gender: 'Male',
    bloodgroup: 'O+',
    height: '5.7',
    weight: '70 kg',
  );

  Address? currentAddress = Address(addressLine1: 'a');

  String address = '';
  String bloodgroup = '';
  String email = '';
  String gender = '';
  String height = '';
  String name = '';
  String phonenum = '';
  String weight = '';
  bool _isEditButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _isEditButtonPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    currentData() async {
      final User? user = FirebaseAuth.instance.currentUser;
      final uid = user?.uid;
      FirestoreData firestore = FirestoreData(uid: uid);
      final names = await firestore.getCurrentUserData();
      if (names != null) {
        name = names[0];
        email = names[1];
        phonenum = names[2];
        address = names[3];
        bloodgroup = names[4];
        gender = names[7];
        height = names[5];
        weight = names[6];
      } else {}
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditProfile();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: currentData(),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const Divider(color: Colors.black, thickness: 2.0),

                    //const SizedBox(height: 16),
                    Widgets().myOrders('Name  :  ', userDetails?.name ?? ''),
                    const SizedBox(height: 30),
                    Widgets().myOrders(
                        'Mobile Number : ', userDetails?.phonenumber ?? ''),
                    const SizedBox(height: 30),
                    Widgets().myOrders('Email Id : ', userDetails?.email ?? ''),
                    const SizedBox(height: 30),
                    Widgets().myOrders(
                        'Blood Group: ', userDetails?.bloodgroup ?? ''),
                    const SizedBox(height: 30),
                    Widgets().myOrders('Gender :', userDetails?.gender ?? ''),
                    const SizedBox(height: 30),
                    Widgets().myOrders('Height:  ', userDetails?.height ?? ''),
                    const SizedBox(height: 16),
                    Widgets().myOrders('Weight:  ', userDetails?.weight ?? ''),
                    const SizedBox(height: 16),
                    //const Divider(color: Colors.black, thickness: 2.0),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Column(
                              children: const [
                                Text('Name: Atanu', style: kprofiletext),
                                Text('Mobile Number: 7008183804',
                                    style: kprofiletext),
                                Text('Email Id: jena.atanusabyasachi@gmail.com',
                                    style: kprofiletext),
                                Text('Blood Group: O+', style: kprofiletext),
                                Text('Gender : Male', style: kprofiletext),
                                Text('Height: 5.7', style: kprofiletext),
                                Text('Weight: 70', style: kprofiletext),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return UserAddress(
                                                userAddress: currentAddress);
                                          },
                                        ),
                                      );
                                    },
                                    child: const Text('Edit')),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Remove'))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add New Address'),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return UserAddress();
              },
            ),
          );
        },
      ),
    );
  }
}
