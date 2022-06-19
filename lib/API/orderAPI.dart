// ignore_for_file: avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthshared/models/order_model.dart';

class OrdersAPI {
  // Future<Order?> medicineOrder(String medicineType, String adress,
  //     String phoneNum, String prescriptionURL, String name) async {
  //   final User? user = FirebaseAuth.instance.currentUser;
  //   final uid = user?.uid;

  //   await FirebaseFirestore.instance.collection('orders').doc('123').set({
  //     'name': name,
  //     'Address': adress,
  //     'Phone Number': phoneNum,
  //     'PrescriptionURL': prescriptionURL,
  //     'uid': uid,
  //   });
  //   return null;
  // }

  Future<List<Order>?> fetchMyOrders() {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    CollectionReference orderCollection =
        FirebaseFirestore.instance.collection('orders');

    return orderCollection.get().then(
      (querySnapshot) {
        List<Order>? lstOrders = [];
        for (var element in querySnapshot.docs) {
          final orderMap = element.data() as Map<String, dynamic>;

          final order = Order.fromMap(orderMap);
          if (order.userId == uid) {
            lstOrders.add(order);
          }
        }
        print('+++$lstOrders+++');
        return lstOrders;
      },
    );
  }
}
