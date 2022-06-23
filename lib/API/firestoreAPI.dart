// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthshared/models/address_model.dart';
import 'package:healthshared/models/order_model.dart';
import 'package:tnshealth/API/userAPI.dart';

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
    String? userID = await UserAPI().getUserID();
    Address? address;
    AppUser? _appUser;
    try {
      DocumentSnapshot ds = await userCollection.doc(userID).get();
      final userdata = ds.data() as Map<String, dynamic>;
      _appUser = AppUser.fromMap(userdata);

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
    final _address = orderModel.address;
    FirebaseFirestore.instance.collection('orders').doc(orderModel.orderId).set(
      {
        'name': orderModel.name,
        'prescriptionURL': orderModel.prescriptionURL,
        'orderStatus': orderModel.orderStatus,
        'orderId': orderModel.orderId,
        'orderTime': orderModel.orderTime,
        'orderDate': orderModel.orderDate,
        'deliveryDate': orderModel.deliveryDate,
        'deliveryTime': orderModel.deliveryTime,
        'userId': orderModel.userId,
        'vendorId': orderModel.vendorId,
        'address': {
          'patientName': _address?.patientName,
          'addressId': _address?.addressId,
          'addressLine1': _address?.addressLine1,
          'addressLine2': _address?.addressLine2,
          'city': _address?.city,
          'addressType': _address?.addressType,
          'phoneNumber': _address?.phoneNumber,
          'pincode': _address?.pincode,
          'state': _address?.state
        }
      },
    );
  }
}
