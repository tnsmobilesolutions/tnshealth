import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthshared/models/address_model.dart';
import 'package:tnshealth/API/firestoreAPI.dart';

import 'package:tnshealth/screen/Profile/editprofile.dart';
import 'package:tnshealth/screen/Profile/userAddress.dart';

const kprofiletext = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

class Profile extends StatefulWidget {
  Profile({Key? key, this.address}) : super(key: key);
  List<Address?>? address;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Address?>? address;
  String? bloodgroup;
  String? email;
  String? gender;
  String? height;
  String? name;
  String? phoneNumber;
  String? weight;
  String? bloodGroup;
  String? country;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentData() async {
      final User? user = FirebaseAuth.instance.currentUser;
      final uid = user?.uid;
      FirestoreData firestore = FirestoreData(uid: uid);
      final names = await firestore.getCurrentUserData();
      if (names != null) {
        name = names.name;
        email = names.email;
        height = names.height;
        weight = names.weight;
        gender = names.gender;
        bloodGroup = names.bloodGroup;
        country = names.country;
        address = names.address?.cast<Address?>();
        phoneNumber = names.phoneNumber;
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const Divider(color: Colors.black, thickness: 2.0),

                    //const SizedBox(height: 16),
                    Text('Name - $name'),
                    const SizedBox(height: 5),
                    Text('Email - $email'),
                    const SizedBox(height: 5),
                    Text('Height - $height'),
                    const SizedBox(height: 5),
                    Text('Weight - $weight'),
                    const SizedBox(height: 5),
                    Text('Gender - $gender'),
                    const SizedBox(height: 5),
                    Text('BloodGroup - $bloodGroup'),
                    const SizedBox(height: 5),
                    Text('Country - $country'),
                    const SizedBox(height: 10),
                    //const Divider(color: Colors.black, thickness: 2.0),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(address != null
                                    ? 'Name : ${address![0]?.patientName}'
                                    : ''),
                                Text(address != null
                                    ? 'phone Number : ${address![0]?.phoneNumber}'
                                    : ''),
                                Text(address != null
                                    ? 'City : ${address![0]?.city}'
                                    : ''),
                                Text(address != null
                                    ? 'State : ${address![0]?.state}'
                                    : ''),
                                Text(address != null
                                    ? 'Pincode : ${address![0]?.pincode}'
                                    : ''),
                                Text(address != null
                                    ? 'Address Type : ${address![0]?.addressType}'
                                    : ''),
                                Text(address != null
                                    ? 'Address ID : ${address![0]?.addressId}'
                                    : ''),
                                Text(address != null
                                    ? 'Address : ${address![0]?.addressLine1},'
                                        '${address![0]?.addressLine2}'
                                    : ''),
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
                                              userAddress: address,
                                              title: 'Edit Address',
                                              buttonText: 'Edit',
                                            );
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
                return UserAddress(
                  title: 'Add New Address',
                  buttonText: 'Add',
                );
              },
            ),
          );
        },
      ),
    );
  }
}
