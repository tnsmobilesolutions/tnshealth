import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tnshealth/model/ordermodel.dart';

class orders {
  // upload medicine order

  Future<Order?> medicineOrder(String medicineType, String adress,
      String phoneNum, String PrescriptionURL, String name) async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    final dbOrder =
        await FirebaseFirestore.instance.collection('orders').doc('123').set({
      'name': name,
      'Address': adress,
      'Phone Number': phoneNum,
      'PrescriptionURL': PrescriptionURL,
      'uid': uid,
    });
  }
}
