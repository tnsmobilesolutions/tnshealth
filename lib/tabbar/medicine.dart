import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:tnshealth/API/firestoreAPI.dart';
import 'package:tnshealth/API/userAPI.dart';

import 'package:tnshealth/medicine/fileupload.dart';

import 'package:tnshealth/model/ordermodel.dart';

import 'package:tnshealth/screen/Dashboard.dart';
import 'package:tnshealth/screen/Profile/addNewAddress.dart';
import 'package:uuid/uuid.dart';

class Medicine extends StatefulWidget {
  const Medicine({
    Key? key,
  }) : super(key: key);

  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  String? prescriptionURL;
  XFile? imageFromUploadButton;
  final _formKey = GlobalKey<FormState>();
  String? medicineType;
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final kTextStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String name = '';
  String address = '';
  String phonenum = '';
  String? uid;
  String? vendorID;

  @override
  void initState() {
    super.initState();
    medicineType = 'Allopathy';
  }

  currentData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    uid = user?.uid;
    FirestoreData firestore = FirestoreData(uid: uid);
    final names = await firestore.getCurrentUserData();
    if (names != null) {
      name = names[0];
      address = names[3];
      phonenum = names[2];
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
                      Text(DateFormat("dd-MM-yyyy").format(DateTime.now())),
                      const SizedBox(height: 20),

                      Text(DateFormat("hh:mm:ss a").format(DateTime.now())),
                      const SizedBox(height: 20),

                      Text('Hello $name ):'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Type Of Medicine', style: kTabBar),
                          DropdownButton<String>(
                            value: medicineType,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 3,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                medicineType = newValue!;
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
                              onPressed: () async {
                                imageFromUploadButton = await Navigator.push(
                                    context, MaterialPageRoute(
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
                      Text('Address:$address'),
                      Text('Phone: -$phonenum'),
                      // const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddNewAddress(),
                                  ));
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Add New Address'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      // Text('Mobile No.', style: kTabBar),
                      // const SizedBox(height: 20),

                      Center(
                          child: FloatingActionButton.extended(
                        heroTag: 'btn2',
                        onPressed: () async {
                          vendorID = await userAPI().getVendorID();
                          prescriptionURL = await uploadImagetoFirebadseStorage(
                              imageFromUploadButton!);

                          // if (_formKey.currentState != null &&
                          //     _formKey.currentState!.validate()) {
                          Order orderModel = Order(
                            name: name,
                            deliveryDate: '',
                            deliveryTime: '',
                            orderDate:
                                DateFormat("dd-MM-yyyy").format(DateTime.now()),
                            orderTime:
                                DateFormat("hh:mm:ss a").format(DateTime.now()),
                            orderId: const Uuid().v1(),
                            prescriptionURL: prescriptionURL,
                            userId: uid,
                            vendorId: vendorID,
                          );
                          FirestoreData().createNewOrder(orderModel);
                          // } else {
                          //   print(
                          //       '*HELLO*********$uploadImagetoFirebadseStorage(previewImage!)}*********HELLO*');
                          // }

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

  //uploading to firebasee
  Future<String?> uploadImagetoFirebadseStorage(XFile image) async {
    // print('**************${getImageName(image)}**************');
    Reference db = FirebaseStorage.instance.ref('$name/${getImageName(image)}');
    await db.putFile(File(image.path));
    return await db.getDownloadURL();
  }

  //return image name
  String getImageName(XFile image) {
    return image.path.split("/").last;
  }
}
