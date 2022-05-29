import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tnshealth/API/firestoreAPI.dart';
import 'package:tnshealth/screen/Profile/add_new_address.dart';
import 'package:tnshealth/screen/Profile/editprofile.dart';
import 'package:tnshealth/widget.dart';

const kprofiletext = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String address = '';
  String bloodgroup = '';
  String email = '';
  String gender = '';
  String height = '';
  String name = '';
  String phonenum = '';
  String weight = '';

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
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddNewAddress();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
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
                      Container(
                        child: Row(
                          children: const [TextField()],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Widgets().myOrders('Name  :  ', 'Atanu Sabyasachi'),
                      const SizedBox(height: 30),
                      Widgets().myOrders('Mobile Number : ', '7008183804'),
                      const SizedBox(height: 30),
                      Widgets().myOrders(
                          'Email Id : ', 'jena.atanusabyasachi@gmail.com'),
                      const SizedBox(height: 30),
                      Widgets().myOrders('Blood Group: ', 'O+'),
                      const SizedBox(height: 30),
                      Widgets().myOrders('Gender :', 'Male'),
                      const SizedBox(height: 30),
                      Widgets().myOrders('Height:  ', '5.7'),
                      const SizedBox(height: 16),
                      Widgets().myOrders('Weight:  ', '70'),
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
                                  Text(
                                      'Email Id: jena.atanusabyasachi@gmail.com',
                                      style: kprofiletext),
                                  Text('Blood Group: O+', style: kprofiletext),
                                  Text('Gender : Male', style: kprofiletext),
                                  Text('Height: 5.7', style: kprofiletext),
                                  Text('Weight: 70', style: kprofiletext),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const EditProfile();
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add New Address'),
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
