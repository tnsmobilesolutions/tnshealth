import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tnshealth/API/firestoreAPI.dart';

class imageUploadToFirebase extends StatefulWidget {
  const imageUploadToFirebase({Key? key}) : super(key: key);

  @override
  State<imageUploadToFirebase> createState() => _imageUploadToFirebaseState();
}

class _imageUploadToFirebaseState extends State<imageUploadToFirebase> {
  // String name = '';
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
                              if (previewImage != null) {
                                Navigator.pop(context, previewImage);
                                await ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.red,
                                        elevation: 6,
                                        behavior: SnackBarBehavior.floating,
                                        content: Text(
                                          'Prescription Uploaded',
                                        )));
                              } else {
                                await ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.red,
                                        elevation: 6,
                                        behavior: SnackBarBehavior.floating,
                                        content: Text(
                                          'Please Upload any Prescription',
                                        )));
                              }
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
  }
}

Future<XFile?> camera() async {
  return await ImagePicker().pickImage(source: ImageSource.camera);
}

Future<XFile?> galery() async {
  return await ImagePicker().pickImage(source: ImageSource.gallery);
}
