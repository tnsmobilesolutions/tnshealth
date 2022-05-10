import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreData {
  //Collection Reference

  final String? uid;
  FirestoreData({this.uid});

  final UserCollection = FirebaseFirestore.instance.collection('users');

  //update to fireStore

  Future updateUserData(String? name, email, gender, phonenum, dateofbirth,
      bloodgroup, maritial, height, weight, adress) async {
    return UserCollection.doc(uid).set({
      'email': email,
      'name': name,
      'mobile': phonenum,
      'adress': adress,
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

  Future getCurrentUserData() async {
    try {
      DocumentSnapshot ds = await UserCollection.doc(uid).get();
      String name = ds.get('name');
      String email = ds.get('email');
      String mobile = ds.get('mobile');
      String adress = ds.get('adress');
      String bloodGroup = ds.get('BloodGroup');
      String gender = ds.get('Gender');
      String height = ds.get('Height');
      String weight = ds.get('Weight');

      return [
        name,
        email,
        mobile,
        adress,
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
    final User? user = await FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    return uid;

    // here you write the codes to input the data into firestore
  }
}
