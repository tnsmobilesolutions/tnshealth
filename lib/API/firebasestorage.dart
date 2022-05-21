import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';

class FirebaseAPI {
// //uploading to firebasee
//   Future<String?> uploadImagetoFirebadseStorage(XFile image) async {
//     print('**************${getImageName(image)}**************');
//     Reference db =
//         FirebaseStorage.instance.ref('testFolder/${getImageName(image)}');
//     await db.putFile(File(image.path));
//     return await db.getDownloadURL();
//   }

  // Future<String?> deleteImagefromFirebase(XFile image) async {
  //   FirebaseStorage.instance.refFromURL('').delete();
  //   return '';
  // }

// //return image name
//   String getImageName(XFile image) {
//     return image.path.split("/").last;
//   }

  // static Future<void> deleteFile(String url) {
  //   try {
  //     return FirebaseStorage.instance.refFromURL(url).delete();
  //   } on FirebaseException catch (e) {
  //     print(e.toString());
  //     return Future.error(e.toString());
  //   }
  // }

}
