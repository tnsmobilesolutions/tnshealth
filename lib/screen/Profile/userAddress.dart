import 'package:flutter/material.dart';
import 'package:healthshared/models/address_model.dart';
import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/model/usermodel.dart';
import 'package:tnshealth/screen/Dashboard.dart';

import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class UserAddress extends StatefulWidget {
  UserAddress(
      {Key? key,
      this.userAddress,
      required this.title,
      required this.buttonText})
      : super(key: key);
  List<Address?>? userAddress;
  String title;
  String buttonText;
  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  final _formKey = GlobalKey<FormState>();
  final fullnamecontroller = TextEditingController();
  final TextEditingController? addressline1namecontroller =
      TextEditingController();
  final addressline2namecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final countrycontroller = TextEditingController();
  final addresstypecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      fullnamecontroller.text = (widget.userAddress != null
          ? widget.userAddress![0]!.patientName
          : '')!;
      phonenumbercontroller.text = (widget.userAddress != null
          ? widget.userAddress![0]!.phoneNumber.toString()
          : '');
      addresstypecontroller.text = (widget.userAddress != null
          ? widget.userAddress![0]!.addressType
          : '')!;
      addressline1namecontroller?.text = (widget.userAddress != null
          ? widget.userAddress![0]!.addressLine1
          : '')!;
      addressline2namecontroller.text = (widget.userAddress != null
          ? widget.userAddress![0]!.addressLine2
          : '')!;
      citycontroller.text =
          (widget.userAddress != null ? widget.userAddress![0]!.city : '')!;
      statecontroller.text =
          (widget.userAddress != null ? widget.userAddress![0]!.state : '')!;
      pincodecontroller.text = (widget.userAddress != null
          ? widget.userAddress![0]!.pincode.toString()
          : '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
                TextFormField(
                  controller: addressline1namecontroller,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    addressline1namecontroller?.text = value!;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                    labelText: 'Address Line 1',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: addressline2namecontroller,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                    labelText: 'Address Line 2',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: citycontroller,
                  keyboardType: TextInputType.name,
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
                    icon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: 'City',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: statecontroller,
                  keyboardType: TextInputType.name,
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
                    icon: Icon(Icons.my_location),
                    border: OutlineInputBorder(),
                    labelText: 'State',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: pincodecontroller,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6}[0-9]$');
                    if (value!.isEmpty) {
                      return 'Please enter correct pin';
                    }
                    if (!regex.hasMatch(value) && value.length != 6) {
                      return ("Enter atleast 6 digit");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_pin),
                    border: OutlineInputBorder(),
                    labelText: 'Pincode',
                  ),
                ),
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: addresstypecontroller,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_searching),
                    border: OutlineInputBorder(),
                    labelText: 'Address Type',
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        Address address = Address(
                          patientName: fullnamecontroller.text,
                          addressType: addresstypecontroller.text,
                          phoneNumber: int.tryParse(phonenumbercontroller.text),
                          addressId: const Uuid().v1(),
                          addressLine1: addressline1namecontroller?.text,
                          addressLine2: addressline2namecontroller.text,
                          city: citycontroller.text,
                          pincode: int.tryParse(pincodecontroller.text),
                          state: statecontroller.text,
                        );

                        // widget.buttonText == 'Add'
                        UserAPI().addNewAddress(address);
                        // : userAPI().updateAddressData(address);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                elevation: 6,
                                behavior: SnackBarBehavior.floating,
                                content: Text('Address updated successfully')));
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
                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
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
