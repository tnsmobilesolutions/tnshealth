import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:tnshealth/API/firestoreAPI.dart';
import 'package:tnshealth/API/userAPI.dart';

import 'package:tnshealth/medicine/fileupload.dart';
import 'package:tnshealth/model/addressmodel.dart';

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
  // final _formKey = GlobalKey<FormState>();
  String? medicineType;
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final kTextStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String? name;
  List<Address?>? address;
  String? phonenum;
  String? uid;
  String? vendorID;
  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String currentTime = DateFormat("hh:mm:ss a").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    // FirestoreData().getCurrentUserData();
    medicineType = 'Allopathy';
  }

  @override
  Widget build(BuildContext context) {
    currentData() async {
      final User? user = FirebaseAuth.instance.currentUser;
      uid = user?.uid;
      FirestoreData firestore = FirestoreData(uid: uid);
      final names = await FirestoreData().getCurrentUserData();
      if (names != null) {
        name = names.name;
        phonenum = names.phoneNumber;
        address = names.address;
      } else {
        print('names = null************$uid***********');
      }
    }

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
                      Text('Order Date : $currentDate'),
                      const SizedBox(height: 20),

                      Text('Order Time : $currentTime'),
                      const SizedBox(height: 20),

                      Text('$name '),
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

                      const SizedBox(height: 10),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
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
                        ),
                      ),

                      //Text('Phone: -$phonenum'),
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
                            deliveryDate: currentDate,
                            deliveryTime: DateFormat("hh:mm:ss a").format(
                                DateTime.now().add(const Duration(hours: 1))),
                            orderDate: currentDate,
                            orderTime: currentTime,
                            orderId: const Uuid().v1(),
                            prescriptionURL: prescriptionURL,
                            userId: uid,
                            vendorId: vendorID,
                            address: [
                              Address(
                                patientName: address?[0]?.patientName,
                                addressId: address?[0]?.addressId,
                                addressLine1: address?[0]?.addressLine1,
                                addressLine2: address?[0]?.addressLine2,
                                addressType: address?[0]?.addressType,
                                city: address?[0]?.city,
                                state: address?[0]?.state,
                                pincode: address?[0]?.pincode,
                                phoneNumber: address?[0]?.phoneNumber,
                              )
                            ],
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
