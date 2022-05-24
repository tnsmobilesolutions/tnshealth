import 'package:flutter/material.dart';

import 'package:tnshealth/model/usermodel.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, this.currentuser}) : super(key: key);
  final AppUser? currentuser;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  @override
  void initState() {
    nameController.text = AppUser().name ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Name',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Mobile No.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Mobile Number',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Email-Id',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
              TextFormField(
                controller: addressController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: ' Enter Your Address',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
              TextFormField(
                controller: bloodGroupController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter bloodGroup';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'BloodGroup',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
              TextFormField(
                controller: genderController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Choose Your Gender';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Gender',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your Height in Cm';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Height',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Weight in Kg';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Weight',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
