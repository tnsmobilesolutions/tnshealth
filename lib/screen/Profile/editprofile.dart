import 'package:flutter/material.dart';
import 'package:healthshared/models/address_model.dart';

import 'package:tnshealth/API/userAPI.dart';

import 'package:tnshealth/model/usermodel.dart';
import 'package:tnshealth/screen/Profile/userAddress.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key, this.currentuser}) : super(key: key);
  AppUser? currentuser;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final fullnamecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  final addressController = TextEditingController();
  final bloodgroupcontroller = TextEditingController();
  final heightcontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  final countrycontroller = TextEditingController();
  List<Address?>? address;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        fullnamecontroller.text =
            widget.currentuser != null ? widget.currentuser?.name ?? '' : '';
        phonenumbercontroller.text = widget.currentuser != null
            ? widget.currentuser!.phoneNumber ?? ''
            : '';
        emailcontroller.text =
            widget.currentuser != null ? widget.currentuser!.email ?? '' : '';
        bloodgroupcontroller.text = widget.currentuser != null
            ? widget.currentuser!.bloodGroup ?? ''
            : '';
        gendercontroller.text =
            widget.currentuser != null ? widget.currentuser!.gender ?? '' : '';
        heightcontroller.text =
            widget.currentuser != null ? widget.currentuser!.height ?? '' : '';
        weightcontroller.text =
            widget.currentuser != null ? widget.currentuser!.weight ?? '' : '';
        countrycontroller.text =
            widget.currentuser != null ? widget.currentuser!.country ?? '' : '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    address = widget.currentuser?.address;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: fullnamecontroller,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{3,}[a-z A-Z]$');
                    if (value == null || value.isEmpty) {
                      return (" Name cannot be Empty");
                    }
                    if (!regex.hasMatch(value) && value.length < 3) {
                      return ("Enter Valid name(Min. 3 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    value = fullnamecontroller.text;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{10}$');
                    if (value!.isEmpty) {
                      return ("Please enter Phone Number");
                    }
                    if (!regex.hasMatch(value) && value.length != 10) {
                      return ("Enter 10 Digit Mobile Number");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phonenumbercontroller.text = value!;
                  },
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  controller: phonenumbercontroller,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailcontroller.text = value!;
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Email Id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  // keyboardType: TextInputType.none,
                  autofocus: false,
                  controller: bloodgroupcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bloodgroup';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    bloodgroupcontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.bloodtype),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "BloodGroup",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  // keyboardType: TextInputType.none,
                  autofocus: false,
                  controller: gendercontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter gender';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    gendercontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.male),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Gender",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  controller: heightcontroller,
                  onSaved: (value) {
                    heightcontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    RegExp regex = RegExp(r'^[0-9,]$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    if (!regex.hasMatch(value) && value.length < 3) {
                      return ("Enter Valid name(Min. 3 Character)");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.height),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Height",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  controller: weightcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    weightcontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.monitor_weight),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Weight",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: countrycontroller,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter correct country';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 260,
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: address?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(address != null
                                          ? 'Name : ${address![index]?.patientName}'
                                          : ''),
                                      Text(address != null
                                          ? 'phone Number : ${address![index]?.phoneNumber}'
                                          : ''),
                                      Text(address != null
                                          ? 'City : ${address![index]?.city}'
                                          : ''),
                                      Text(address != null
                                          ? 'State : ${address![index]?.state}'
                                          : ''),
                                      Text(address != null
                                          ? 'Pincode : ${address![index]?.pincode}'
                                          : ''),
                                      Text(address != null
                                          ? 'Address Type : ${address![index]?.addressType}'
                                          : ''),
                                      Text(address != null
                                          ? 'Address ID : ${address![index]?.addressId}'
                                          : ''),
                                      Text(address != null
                                          ? 'Address : ${address![index]?.addressLine1},'
                                              '${address![index]?.addressLine2}'
                                          : ''),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return UserAddress(
                                                    title: 'Edit Address',
                                                    buttonText: 'Update',
                                                    userAddress: address,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: const Text('Edit')),
                                      ElevatedButton(
                                          onPressed: () {
                                            userAPI().deleteAddress();
                                          },
                                          child: const Text('Remove'))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    AppUser _appUser = AppUser(
                      name: fullnamecontroller.text.trim(),
                      email: emailcontroller.text.trim(),
                      country: countrycontroller.text,
                      phoneNumber: phonenumbercontroller.text.trim(),
                      bloodGroup: bloodgroupcontroller.text,
                      gender: gendercontroller.text,
                      height: heightcontroller.text,
                      weight: weightcontroller.text,
                    );

                    userAPI().updateUserData(_appUser);

                    if (_appUser != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).iconTheme.color,
                          behavior: SnackBarBehavior.floating,
                          content: const Text('Updated User data successfully'),
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).iconTheme.color,
                          behavior: SnackBarBehavior.floating,
                          content: const Text('No Change'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
