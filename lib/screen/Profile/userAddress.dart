import 'package:flutter/material.dart';
import 'package:healthshared/models/address_model.dart';

// ignore: must_be_immutable
class UserAddress extends StatefulWidget {
  UserAddress({Key? key, this.userAddress}) : super(key: key);
  Address? userAddress;
  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(),
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
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Address Line 1',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(),
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
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Address Line 2',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter city';
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
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'City',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter correct state';
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
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'State',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter correct country';
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
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Country',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: TextEditingController(),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter correct pin';
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
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  labelText: 'Pincode',
                  labelStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.red),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit',
                    style: TextStyle(
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
    );
  }
}
