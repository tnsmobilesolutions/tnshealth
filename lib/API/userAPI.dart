// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:tnshealth/model/usermodel.dart';

import 'firestoreAPI.dart';

class userAPI {
  static AppUser? _loggedInUser;

  static AppUser? get loggedInUser {
    return _loggedInUser;
  }

  final _auth = FirebaseAuth.instance;

//SIGNIN

  Future<AppUser?> signIn(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => uid);

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final user =
          users.where("uid", isEqualTo: userCredential?.user?.uid).get().then(
        (querySnapshot) {
          final userData =
              querySnapshot.docs.first.data() as Map<String, dynamic>;
          final user = AppUser.fromMap(userData);
          _loggedInUser = user;
          return user;
        },
      );
      return user;

      //return uid.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

//SIGNUP

  signUp(
    AppUser _appUser,
    String password,
  ) async {
    try {
      final userCredential = await _auth
          .createUserWithEmailAndPassword(
              email: _appUser.email.toString(), password: password)
          .then(
        (value) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(_appUser.userID)
              .set(
            {
              'uid': value.user!.uid,
              'userId': _appUser.userID,
              'name': _appUser.name,
              'Email': _appUser.email,
              'BloodGroup': _appUser.bloodgroup,
              'Gender': _appUser.gender,
              'Height': _appUser.height,
              'Weight': _appUser.weight,
              'PhoneNumber.': _appUser.phonenumber,
              'Address': [
                {
                  'patientName': _appUser.address!.patientName,
                  'addressId': _appUser.address!.addressId,
                  'addressLine1': _appUser.address!.addressLine1,
                  'addressLine2': _appUser.address!.addressLine2,
                  'city': _appUser.address!.city,
                  'addressType': _appUser.address!.state,
                  'contactNumber': _appUser.address!.pincode,
                  'pincode': _appUser.address!.contactNumber,
                  'state': _appUser.address!.addressType
                }
              ]
            },
          );
          return value;
          print(value);
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email already is in use');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

  //LogOut

  dynamic logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); //
    }
  }

  //Getting User UID

  Future<AppUser?> getAppUserFromUid(String uid) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final user = users.where("uid", isEqualTo: uid).get().then(
        (querySnapshot) {
          final userData =
              querySnapshot.docs.first.data() as Map<String, dynamic>;
          final user = AppUser.fromMap(userData);
          _loggedInUser = user;
          return user;
        },
      );
      return user;

      //return uid.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

  String name = '';
//current user data
  currentData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    FirestoreData firestore = FirestoreData(uid: uid);
    final names = await firestore.getCurrentUserData();
    if (names != null) {
      name = names[0];
    } else {}
    // return name;
  }

  Future<String?> getDocumentID() async {
    String? documentID;
    var collection = FirebaseFirestore.instance.collection('orders');
    var querySnapshots = await collection.get();
    for (var snapshot in querySnapshots.docs) {
      documentID = snapshot.id; // <-- Document ID
    }
    return documentID;
  }

  Future<String?> getVendorID() async {
    String? vendorID;
    var vendorCollection = FirebaseFirestore.instance.collection('vendors');
    var querySnapshots = await vendorCollection
        .where('ServiceType', isEqualTo: 'Medicine')
        .get();
    for (var snapshot in querySnapshots.docs) {
      vendorID = snapshot.id; // <-- Document ID
    }
    print('===$vendorID===');
    return vendorID;
  }
}
