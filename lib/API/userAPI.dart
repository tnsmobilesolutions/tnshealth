// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthshared/healthshared.dart';

import 'package:tnshealth/model/usermodel.dart';

import 'firestoreAPI.dart';

class UserAPI {
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
          print('******${_appUser.address}******');
          final _address = _appUser.address?[0];
          FirebaseFirestore.instance
              .collection('users')
              .doc(_appUser.userId)
              .set(
            {
              'uid': value.user?.uid,
              'userId': _appUser.userId,
              'name': _appUser.name,
              'email': _appUser.email,
              'bloodGroup': _appUser.bloodGroup,
              'gender': _appUser.gender,
              'height': _appUser.height,
              'weight': _appUser.weight,
              'country': _appUser.country,
              'phoneNumber': _appUser.phoneNumber,
              'address': [
                {
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
              ]
            },
          );
          return value;
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
    return UserCredential;
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
      //name = names[0];
    } else {}
  }

//vendorId
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

// userId
  Future<String?> getUserID() async {
    String? userID;
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;

    var userCollection = FirebaseFirestore.instance.collection('users');
    var querySnapshots =
        await userCollection.where('uid', isEqualTo: uid).get();
    for (var snapshot in querySnapshots.docs) {
      userID = snapshot.id; // <-- Document ID
    }
    print('===$userID===');
    return userID;
  }

  // add  new address
  Future<AppUser?> addNewAddress(Address address) async {
    String? docId = await getUserID();
    var collection = FirebaseFirestore.instance.collection('users').doc(docId);
    // Remove the 'capital' field from the document
    Address _address = address;
    final data = {
      'patientName': _address.patientName,
      'addressId': _address.addressId,
      'addressLine1': _address.addressLine1,
      'addressLine2': _address.addressLine2,
      'city': _address.city,
      'addressType': _address.addressType,
      'phoneNumber': _address.phoneNumber,
      'pincode': _address.pincode,
      'state': _address.state
    };
    final updates = <String, dynamic>{
      "address": FieldValue.arrayUnion([data]),
    };
    collection.update(updates);
    return null;
  }

  Future<AppUser?> updateUserAddress(Address address) async {
    String? docId = await getUserID();
    DocumentReference userDocument =
        FirebaseFirestore.instance.collection('users').doc(docId);
    var userDetails = userDocument.get();
    userDetails.then((value) {
      print(value);
    });
    return null;
  }

// update userData
  Future<AppUser?> updateUserProfile(AppUser _appUser) async {
    var collection = FirebaseFirestore.instance.collection('users');
    String? docId = await getUserID();
    collection
        .doc(docId) // <-- Doc ID where data should be updated.
        .update(_appUser.toMap());
    return null;
  }

  //delete only address array
  Future<AppUser?> deleteAddress() async {
    String? docId = await getUserID();
    var collection = FirebaseFirestore.instance.collection('users').doc(docId);
    // Remove the 'capital' field from the document
    final updates = <String, dynamic>{
      "address": FieldValue.delete(),
    };
    collection.update(updates);
    return null;
  }
}
