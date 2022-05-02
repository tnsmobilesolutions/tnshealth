import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tnshealth/model/usermodel.dart';

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

//SIGNUP

  Future<AppUser?> signUp(
      String email,
      String password,
      String name,
      String mobile,
      String adress,
      String bloodGroup,
      String gender,
      String height,
      String weight) async {
    try {
      final userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid)
              .set(
            {
              'email': email,
              'uid': value.user!.uid,
              'name': name,
              'mobile': mobile,
              'adress': adress,
              'BloodGroup': bloodGroup,
              'Gender': gender,
              'Height': height,
              'Weight': weight
            },
          );
          return value;
        },
      );
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final user =
          users.where("uid", isEqualTo: userCredential.user?.uid).get().then(
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

      //TODO : replace this logic with collection map

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
}
