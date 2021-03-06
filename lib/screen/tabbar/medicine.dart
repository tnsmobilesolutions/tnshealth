import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:healthshared/models/address_model.dart';
import 'package:healthshared/models/order_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tnshealth/API/firestoreAPI.dart';
import 'package:tnshealth/API/userAPI.dart';

import 'package:tnshealth/screen/Dashboard.dart';
import 'package:tnshealth/screen/Profile/userAddress.dart';
import 'package:tnshealth/screen/image%20upload/fileupload.dart';

import 'package:uuid/uuid.dart';

class Medicine extends StatefulWidget {
  const Medicine({
    Key? key,
  }) : super(key: key);

  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  String prescriptionURL = '';
  late XFile imageFromUploadButton;
  // final _formKey = GlobalKey<FormState>();
  String? medicineType;

  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final kTextStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String? name;
  List<Address?>? address;
  bool selectedCard = false;
  String? phonenum;
  String? uid;
  String? vendorID;
  int selectedindex = 0;
  bool isTapped = false;
  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String currentTime = DateFormat("hh:mm:ss a").format(DateTime.now());

  @override
  void initState() {
    super.initState();

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
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                                try {
                                  imageFromUploadButton = await Navigator.push(
                                      context, MaterialPageRoute(
                                    builder: (context) {
                                      return const imageUploadToFirebase();
                                    },
                                  ));
                                } catch (e) {
                                  print(e);
                                }
                              }),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Text('Delivery Address', style: kTabBar),
                      // const SizedBox(height: 20),

                      const SizedBox(height: 10),

                      SizedBox(
                        height: 200,
                        width: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: address?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() {
                                setState(() {
                                  selectedCard = !selectedCard;
                                  selectedindex = index;
                                });
                              }),
                              child: Card(
                                elevation: 20,
                                child: SizedBox(
                                  height: 210,
                                  width: 500,
                                  child: ListTile(
                                    selected: index == selectedindex,
                                    shape: selectedindex == index
                                        ? const RoundedRectangleBorder(
                                            side:
                                                BorderSide(color: Colors.black))
                                        : null,
                                    title: Text(address != null
                                        ? '${address![index]?.patientName}'
                                        : ''),
                                    subtitle: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(address != null
                                              ? 'phone Number : ${address![index]?.phoneNumber}'
                                              : ''),
                                          Text(address != null
                                              ? 'City : ${address![index]?.city}'
                                              : ''),
                                          Text(address != null
                                              ? 'State : ${address![index]?.state}'
                                              : ''),
                                          Text(address != null
                                              ? 'Pincode : ${address![index]?.pincode}'
                                              : ''),
                                          Text(address != null
                                              ? 'Address Type : ${address![index]?.addressType}'
                                              : ''),
                                          Text(address != null
                                              ? 'Address ID : ${address![index]?.addressId}'
                                              : ''),
                                          Text(address != null
                                              ? 'Address : ${address![index]?.addressLine1},'
                                                  '${address![index]?.addressLine2}'
                                              : ''),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return UserAddress(
                                      buttonText: 'Add',
                                      title: 'Add New Address',
                                    );
                                  },
                                ),
                              );
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
                          vendorID = await UserAPI().getVendorID();
                          prescriptionURL = await uploadImageToFirebaseStorage(
                              imageFromUploadButton) as String;

                          Order orderModel = Order(
                            name: name,
                            deliveryDate: currentDate,
                            deliveryTime: DateFormat("hh:mm:ss a").format(
                                DateTime.now().add(const Duration(hours: 1))),
                            orderStatus: 'placed',
                            orderDate: currentDate,
                            orderTime: currentTime,
                            orderId: const Uuid().v1(),
                            prescriptionURL: prescriptionURL,
                            userId: uid,
                            vendorId: vendorID,
                            address: Address(
                              patientName:
                                  address![selectedindex as int]?.patientName,
                              addressId:
                                  address?[selectedindex as int]?.addressId,
                              addressLine1:
                                  address?[selectedindex as int]?.addressLine1,
                              addressLine2:
                                  address?[selectedindex as int]?.addressLine2,
                              addressType:
                                  address?[selectedindex as int]?.addressType,
                              city: address?[selectedindex as int]?.city,
                              state: address?[selectedindex as int]?.state,
                              pincode: address?[selectedindex as int]?.pincode,
                              phoneNumber:
                                  address?[selectedindex as int]?.phoneNumber,
                            ),
                          );

                          FirestoreData().createNewOrder(orderModel);

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const DashBoard();
                            },
                          ));
                          await ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.blueAccent,
                                  elevation: 6,
                                  behavior: SnackBarBehavior.floating,
                                  content: Text(
                                    'Order Placed',
                                  )));
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
  Future<String?> uploadImageToFirebaseStorage(XFile image) async {
    // print('**************${getImageName(image)}**************');
    Reference db = FirebaseStorage.instance.ref('$name/${getImageName(image)}');
    await db.putFile(File(image.path));
    return await db.getDownloadURL();
  }

  //return image name
  String getImageName(XFile image) {
    return image.path.split("/").last;
  }

  // select card
  onCardTapped(int index) {
    print('Card $index tapped');
  }
}
