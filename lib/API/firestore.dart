import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreData {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('users');

  Future updateUserList(
      String email,
      String password,
      String name,
      String mobile,
      String adress,
      String bloodGroup,
      String gender,
      String height,
      String weight) async {
    return await profileList.doc().update({
      'name': name,
      'mobile': mobile,
      'adress': adress,
      'BloodGroup': bloodGroup,
      'Gender': gender,
      'Height': height,
      'Weight': weight
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
