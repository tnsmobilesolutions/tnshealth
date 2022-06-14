// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthshared/models/address_model.dart';
import 'package:tnshealth/screen/Dashboard.dart';

import 'package:uuid/uuid.dart';

class AddNewAddress extends StatefulWidget {
  AddNewAddress({Key? key, required this.buttonText}) : super(key: key);
  String buttonText;

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();
  final adressline1namecontroller = TextEditingController();
  final adressline2namecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final fullnamecontroller = TextEditingController();
  final countrycontroller = TextEditingController();

  Address? newAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: fullnamecontroller,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{3,}$');
                    if (value!.isEmpty) {
                      return (" Name cannot be Empty");
                    }
                    if (!regex.hasMatch(value)) {
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
                  textInputAction: TextInputAction.next,
                  controller: adressline1namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    adressline1namecontroller.text = value!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adress Line 1',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: adressline2namecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adress Line 2',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: citycontroller,
                  validator: (value) {
                    RegExp regex = RegExp(r'^[a-zA-Z, ]+$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid city");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: statecontroller,
                  validator: (value) {
                    RegExp regex = RegExp(r'^[a-zA-Z, ]+$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid state");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'State',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6}[0-9]$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter your valid pincode';
                    }
                    if (!regex.hasMatch(value) && value.length != 6) {
                      return ("Enter 6 digit pincode");
                    }

                    return null;
                  },
                  controller: pincodecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PinCode',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{10,}$');
                    if (value!.isEmpty) {
                      return ("Please enter Phone Number");
                    }
                    if (!regex.hasMatch(value) && value.length > 10) {
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
                      return 'Please enter your country';
                    }
                    return null;
                  },
                  controller: countrycontroller,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.my_location),
                    border: OutlineInputBorder(),
                    labelText: 'Country',
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        Address newAddress = Address(
                          addressId: const Uuid().v1(),
                          addressLine1: adressline1namecontroller.text,
                          addressLine2: adressline2namecontroller.text,
                          city: citycontroller.text,
                          phoneNumber: int.tryParse(phonenumbercontroller.text),
                          patientName: fullnamecontroller.text,
                          pincode: int.tryParse(pincodecontroller.text),
                          state: statecontroller.text,
                          addressType: '',
                        );
                        print(newAddress);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                elevation: 6,
                                behavior: SnackBarBehavior.floating,
                                content: Text('Order add')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                elevation: 6,
                                behavior: SnackBarBehavior.floating,
                                content: Text('error')));
                      }

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DashBoard();
                        },
                      ));
                    },
                    //   if (_formKey.currentState!.validate()) {
                    //     newAddress = Address(
                    //       addressId: const Uuid().v1(),
                    //       addressLine1: adressline1namecontroller.text,
                    //       addressLine2: adressline2namecontroller.text,
                    //       city: citycontroller.text,
                    //       phoneNumber: int.tryParse(phonenumbercontroller.text),
                    //       patientName: fullnamecontroller.text,
                    //       pincode: int.tryParse(pincodecontroller.text),
                    //       state: statecontroller.text,
                    //       addressType: '',
                    //     );
                    //     print(newAddress);
                    //   }
                    // },
                    child: Text(
                      widget.buttonText,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
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
