import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tnshealth/API/firestore.dart';

import 'package:tnshealth/medicine/fileupload.dart';

import 'package:tnshealth/screen/Dashboard.dart';

class Medicine extends StatefulWidget {
  const Medicine({
    Key? key,
  }) : super(key: key);

  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  final addressline1namecontroller = TextEditingController();
  final addressline2namecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  String dropdownValue = 'Allopathy';
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final kTextStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String name = '';
  final phonenumbercontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final statecontroller = TextEditingController();

  currentData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    FirestoreData firestore = FirestoreData(uid: uid);
    final names = await firestore.getCurrentUserData();
    if (names != null) {
      name = names[0];
    } else {
      print('names = null************$uid***********');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: currentData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(DateTime.now().toString()),
                      Text('Hello $name :'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Type Of Medicine', style: kTabBar),
                          DropdownButton<String>(
                            value: dropdownValue,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 3,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Allopathy',
                              'Ayurvedic',
                              'Homeopathy'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Prescription', style: kTabBar),
                          FloatingActionButton.extended(
                              heroTag: 'btn1',
                              label: const Text('Upload'),
                              icon: const Icon(Icons.file_upload_outlined),
                              backgroundColor: Colors.blueAccent,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const imageUploadToFirebase();
                                  },
                                ));
                              }),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Text('Delivery Address', style: kTabBar),
                      // const SizedBox(height: 20),

                      const SizedBox(height: 10),
                      TextField(
                        controller: addressline1namecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address Line 1',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: addressline2namecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address Line 2',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: citycontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'City',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: statecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'State',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: pincodecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PinCode',
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Text('Mobile No.', style: kTabBar),
                      // const SizedBox(height: 20),
                      IntlPhoneField(
                        controller: phonenumbercontroller,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          // print(phone.completeNumber);
                        },
                      ),
                      Center(
                          child: FloatingActionButton.extended(
                        heroTag: 'btn2',
                        onPressed: () {
                          print(addressline1namecontroller.text);
                          print(addressline2namecontroller.text);
                          print(citycontroller.text);
                          print(statecontroller.text);
                          print(pincodecontroller.text);
                          print(phonenumbercontroller.text);
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const DashBoard();
                            },
                          ));
                        },
                        label: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        // icon: const Icon(Icons.thumb_up),
                        backgroundColor: Colors.blueGrey,
                      )),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
