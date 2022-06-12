import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthshared/models/address_model.dart';

import 'package:tnshealth/API/firestoreAPI.dart';

import 'package:tnshealth/model/diagnosis_order_model.dart';
import 'package:tnshealth/screen/Dashboard.dart';

import 'package:uuid/uuid.dart';

class Diagnosys extends StatefulWidget {
  const Diagnosys({Key? key}) : super(key: key);

  @override
  _DiagnosysState createState() => _DiagnosysState();
}

class _DiagnosysState extends State<Diagnosys> {
  @override
  void initState() {
    super.initState();
    FirestoreData().getCurrentUserData();
  }

  final testnamecontroller = TextEditingController();
  final patientnamecontroller = TextEditingController();
  final addressline1namecontroller = TextEditingController();
  final addressline2namecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final countrycontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final addresstypecontroller = TextEditingController();

  final kTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text('Test Name', style: kTabBar),
              // const SizedBox(height: 20),
              TextFormField(
                controller: testnamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Test Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter test name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Text('Patient Name', style: kTabBar),
              // const SizedBox(height: 20),
              TextFormField(
                controller: patientnamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Patient Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text('Patient Address', style: kTabBar),
              const SizedBox(height: 20),
              TextFormField(
                controller: addressline1namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address Line 1',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: addressline2namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address Line 2',
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: citycontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city';
                  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter correct city name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: statecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'State',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter state';
                  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter correct state name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: countrycontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Country',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter country';
                  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter correct country name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('^[0-9]{1,6}'))
                ],
                keyboardType: TextInputType.number,
                controller: pincodecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PinCode',
                ),
                validator: (value) {
                  if (value != null && value.length < 6) {
                    return 'Enter atleast 6';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Text('Mobile No.', style: kTabBar),
              // const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  RegExp regex = RegExp(r'^.{10,}$');
                  if (value!.isEmpty) {
                    return ("Please enterPhone Number");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid Mobile Number(Min. 10 Character)");
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
                controller: addresstypecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address Type (ex. Home, Office)',
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      DiagnosisOrder diagnosticOrderModel = DiagnosisOrder(
                        diagnosisOrderId: const Uuid().v1(),
                        diagnosisName: testnamecontroller.text,
                        diagnosisOrderAddress: Address(
                          addressId: const Uuid().v1(),
                          patientName: patientnamecontroller.text,
                          addressLine1: addressline1namecontroller.text,
                          addressLine2: addressline2namecontroller.text,
                          addressType: addresstypecontroller.text,
                          city: citycontroller.text,
                          state: statecontroller.text,
                          pincode: int.tryParse(pincodecontroller.text),
                          phoneNumber: int.tryParse(phonenumbercontroller.text),
                        ),
                      );
                      // ignore: avoid_print
                      print(diagnosticOrderModel);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          elevation: 6,
                          behavior: SnackBarBehavior.floating,
                          content: Text('Order booked successfully')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                  child: const Text(
                    'Book',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
