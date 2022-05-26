import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tnshealth/model/addressmodel.dart';
import 'package:uuid/uuid.dart';

class AddNewAddress extends StatefulWidget {
  AddNewAddress({Key? key}) : super(key: key);

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
  Address? newAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Address'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
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
              TextField(
                controller: adressline1namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adress Line 1',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: adressline2namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adress Line 2',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: citycontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: statecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'State',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                controller: pincodecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PinCode',
                ),
              ),
              const SizedBox(height: 20),
              IntlPhoneField(
                controller: phonenumbercontroller,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  // print(phone.completeNumber),
                },
              ),
              const SizedBox(height: 20),
              Center(
                  child: TextButton(
                      onPressed: () {
                        newAddress = Address(
                          addressId: const Uuid().v1(),
                          addressLine1: adressline1namecontroller.text,
                          addressLine2: adressline2namecontroller.text,
                          city: citycontroller.text,
                          contactNumber:
                              int.tryParse(phonenumbercontroller.text),
                          patientName: fullnamecontroller.text,
                          pincode: int.tryParse(pincodecontroller.text),
                          state: statecontroller.text,
                          addressType: '',
                        );
                        print(newAddress);
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
