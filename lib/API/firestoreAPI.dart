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

  final UserCollection = FirebaseFirestore.instance.collection('users');

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
    return UserCollection.doc(uid).set({
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
    return UserCollection.snapshots();
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
//   }

  // get Data from FireBase

  Future getCurrentUserData() async {
    String? userID = await userAPI().getUserID();
    List<Address?>? address;
    try {
      DocumentSnapshot ds = await UserCollection.doc(userID).get();

      String name = ds.get('name');
      address = ds.get('Address');
      String email = ds.get('Email');
      String mobile = ds.get('PhoneNumber');
      String bloodGroup = ds.get('BloodGroup');
      String gender = ds.get('Gender');
      String height = ds.get('Height');
      String weight = ds.get('Weight');

      return [
        name,
        email,
        mobile,
        address,
        bloodGroup,
        gender,
        height,
        weight,
      ];
    } catch (e) {
      print(e.toString());
      return null;
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
      'Address': orderModel.orderAddress,
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
