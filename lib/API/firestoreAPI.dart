// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/model/addressmodel.dart';
import 'package:tnshealth/model/ordermodel.dart';
import 'package:tnshealth/model/usermodel.dart';

class FirestoreData {
  //Collection Reference

  final String? uid;
  FirestoreData({this.uid});

  final userCollection = FirebaseFirestore.instance.collection('users');

  //update to fireStore

  Future updateUserData(
    String? email,
    name,
    phonenum,
    address,
    bloodgroup,
    gender,
    height,
    weight,
    dateofbirth,
    maritial,
  ) async {
    return userCollection.doc(uid).set({
      'email': email,
      'name': name,
      'mobile': phonenum,
      'address': address,
      'BloodGroup': bloodgroup,
      'Gender': gender,
      'Height': height,
      'Weight': weight,
      'dateofbirth': dateofbirth,
      'maritial': maritial,
    });
  }

  //Get user Stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }

//  Stream<List<Student>> get firebaseStudents {
//     return Firestore.instance.collection('students').snapshots().map(_firebaseStudentsFromSnapshot);
//   }

//   List<Student> _firebaseStudentsFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return Student(
//         name: doc.data['name'] ?? '',
//         subject: doc.data['subject'] ?? '',

//         //trying to figure out how to map the marks!

//       );
//     }).toList();
//   }jena

  // get Data from FireBase

  Future<AppUser?> getCurrentUserData() async {
    String? userID = await userAPI().getUserID();
    List<Address?>? address;
    AppUser? _appUser;
    try {
      DocumentSnapshot ds = await userCollection.doc(userID).get();
      // print(currentUser);

      final userdata = ds.data() as Map<String, dynamic>;
      _appUser = AppUser.fromMap(userdata);

      // AppUser(
      //   name: ds.get('name'),
      //   email: ds.get('Email'),
      //   phonenumber: ds.get('PhoneNumber'),
      //   bloodgroup: ds.get('BloodGroup'),
      //   gender: ds.get('Gender'),
      //   height: ds.get('Height'),
      //   uid: ds.get('uid'),
      //   userID: ds.get('userId'),
      //   weight: ds.get('Weight'),
      //   address: ds.get('Address'),
      // );
      print(_appUser);
      return _appUser;
    } catch (e) {
      print(e.toString());
      return _appUser;
    }
  }

//uid

  Future<String?> U_ID() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    return uid;

    // here you write the codes to input the data into firestore
  }

  createNewOrder(Order orderModel) {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(orderModel.orderId)
        .set({
      'Name': orderModel.name,
      'Address': orderModel.address,
      'PrescriptionURL': orderModel.prescriptionURL,
      'OrderId': orderModel.orderId,
      'OrderTime': orderModel.orderTime,
      'OrderDate': orderModel.orderDate,
      'DeliveryDate': orderModel.deliveryDate,
      'DeliveryTime': orderModel.deliveryTime,
      'UserID': orderModel.userId,
      'VenderId': orderModel.vendorId
    });
  }
}
