import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tnshealth/API/firebasestorage.dart';
import 'package:tnshealth/API/firestore.dart';
import 'package:tnshealth/tabbar/medicine.dart';

class imageUploadToFirebase extends StatefulWidget {
  const imageUploadToFirebase({Key? key}) : super(key: key);

  @override
  State<imageUploadToFirebase> createState() => _imageUploadToFirebaseState();
}

class _imageUploadToFirebaseState extends State<imageUploadToFirebase> {
  String name = '';
  XFile? previewImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Your Prescription'),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: currentData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    previewImage != null && previewImage!.path.isNotEmpty
                        ? Image.file(
                            File(previewImage!.path),
                            height: 400,
                          )
                        : const SizedBox.shrink(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: FloatingActionButton.extended(
                            label: const Text(
                              'Upload',
                              style: TextStyle(fontSize: 30),
                            ),
                            heroTag: '3',
                            onPressed: () async {
                              try {
                                await uploadImagetoFirebadseStorage(
                                    previewImage!);
                              } catch (e) {
                                return null;
                              }

                              Navigator.pop(context);
                              print(
                                  '**********$uploadImagetoFirebadseStorage(previewImage!)}**********');
                            },
                          ),
                        ),
                        const SizedBox(width: 60),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FloatingActionButton(
                              child: const Icon(Icons.camera_alt),
                              heroTag: '1',
                              onPressed: () async {
                                previewImage = await camera();
                                if (previewImage != null &&
                                    previewImage!.path.isNotEmpty) {
                                  setState(() {});
                                }
                              },
                            ),
                            const SizedBox(height: 30),
                            FloatingActionButton(
                              child: const Icon(Icons.photo),
                              heroTag: '2',
                              onPressed: () async {
                                previewImage = await galery();
                                if (previewImage != null &&
                                    previewImage!.path.isNotEmpty) {
                                  setState(() {});
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  currentData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    FirestoreData firestore = FirestoreData(uid: uid);
    final names = await firestore.getCurrentUserData();
    if (names != null) {
      name = names[0];
    } else {
      print('names = null************$uid***********');
    }
  }

  //uploading to firebasee
  Future<String?> uploadImagetoFirebadseStorage(XFile image) async {
    print('**************${getImageName(image)}**************');
    Reference db = FirebaseStorage.instance.ref('$name/${getImageName(image)}');
    await db.putFile(File(image.path));
    return await db.getDownloadURL();
  }

  //return image name
  String getImageName(XFile image) {
    return image.path.split("/").last;
  }
}

Future<XFile?> camera() async {
  return await ImagePicker().pickImage(source: ImageSource.camera);
}

Future<XFile?> galery() async {
  return await ImagePicker().pickImage(source: ImageSource.gallery);
}
















// import 'dart:async';
// import 'dart:io';
// import 'package:path/path.dart' as path;
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tnshealth/API/firebasestorage.dart';


// typedef OnPickImageCallback = void Function();

// class FileUpload extends StatefulWidget {
//   const FileUpload({Key? key}) : super(key: key);

//   @override
//   _FileUploadState createState() => _FileUploadState();
// }

// class _FileUploadState extends State<FileUpload> {
//   String? imageURL;
//   UploadTask? task;
//   String destination = '';
//   File? file;
//   String? _selectedOption;

// //upliad to firebase storage

//   Future uploadFile() async {
//     if (file == null) {
//       return;
//     } else {}
//     final fileName = path.basename(file!.path);
//     destination = '$_selectedOption/$fileName';

//     task = FirebaseAPI.uploadInFirebase(destination, file!);
//     setState(() {});

//     if (task == null) return;

//     final snapshot = await task!.whenComplete(() {});
//     imageURL = await snapshot.ref.getDownloadURL();
//   }

//   // pick image from camera/gallery

//   List<XFile>? _imageFileList;

//   set _imageFile(XFile? value) {
//     _imageFileList = value == null ? null : [value];
//   }

//   dynamic _pickImageError;
//   bool isVideo = false;

//   String? _retrieveDataError;

//   final ImagePicker _picker = ImagePicker();

//   void _onImageButtonPressed(ImageSource source,
//       {BuildContext? context}) async {
//     await _displayPickImageDialog(context!, () async {
//       try {
//         final pickedFile = await _picker.pickImage(
//           source: source,
//         );
//         setState(() {
//           _imageFile = pickedFile;
//         });
//       } catch (e) {
//         setState(() {
//           _pickImageError = e;
//         });
//       }
//     });
//   }

// // show image what you have picked

//   Widget _previewImages() {
//     final Text? retrieveError = _getRetrieveErrorWidget();
//     if (retrieveError != null) {
//       return retrieveError;
//     }
//     if (_imageFileList != null) {
//       return Semantics(
//           child: ListView.builder(
//             key: UniqueKey(),
//             itemBuilder: (context, index) {
//               return Semantics(
//                 label: 'image_picker_example_picked_image',
//                 child: kIsWeb
//                     ? Image.network(_imageFileList![index].path)
//                     : Image.file(File(_imageFileList![index].path)),
//               );
//             },
//             itemCount: _imageFileList!.length,
//           ),
//           label: 'image_picker_example_picked_images');
//     } else if (_pickImageError != null) {
//       return Text(
//         'Pick image error: $_pickImageError',
//         textAlign: TextAlign.center,
//       );
//     } else {
//       return const Text(
//         'You have not yet picked an image.',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await _picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//   }
//   //let's come to UI

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('hello')),
//       body: Center(
//         child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
//             ? FutureBuilder<void>(
//                 future: retrieveLostData(),
//                 builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//                   switch (snapshot.connectionState) {
//                     case ConnectionState.none:
//                     case ConnectionState.waiting:
//                       return const Text(
//                         'You have not yet picked an image.',
//                         textAlign: TextAlign.center,
//                       );
//                     case ConnectionState.done:
//                       return _previewImages();
//                     default:
//                       if (snapshot.hasError) {
//                         return Text(
//                           'Pick image/video error: ${snapshot.error}}',
//                           textAlign: TextAlign.center,
//                         );
//                       } else {
//                         return const Text(
//                           'You have not yet picked an image.',
//                           textAlign: TextAlign.center,
//                         );
//                       }
//                   }
//                 },
//               )
//             : _previewImages(),
//       ),
//       floatingActionButton: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton.extended(
//             heroTag: 'btn3',
//             onPressed: () async {
//               await uploadFile().then((value) => print('********Done*******'));
//               Navigator.pop(context);
//             },
//             label: const Text(
//               'Upload',
//               style: TextStyle(fontSize: 30),
//             ),
//           ),
//           const SizedBox(
//             width: 50,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               Semantics(
//                 label: 'image_picker_example_from_gallery',
//                 child: FloatingActionButton(
//                   heroTag: 'btn1',
//                   onPressed: () {
//                     isVideo = false;

//                     _onImageButtonPressed(ImageSource.gallery,
//                         context: context);
//                   },
//                   child: const Icon(Icons.photo),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Semantics(
//                 child: FloatingActionButton(
//                   heroTag: 'btn2',
//                   onPressed: () {
//                     isVideo = false;
//                     _onImageButtonPressed(ImageSource.camera, context: context);
//                   },
//                   child: const Icon(Icons.camera_alt),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Text? _getRetrieveErrorWidget() {
//     if (_retrieveDataError != null) {
//       final Text result = Text(_retrieveDataError!);
//       _retrieveDataError = null;
//       return result;
//     }
//     return null;
//   }

//   Future<void> _displayPickImageDialog(
//       BuildContext context, OnPickImageCallback onPick) async {
//     onPick();
//   }
// }
