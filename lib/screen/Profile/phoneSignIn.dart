import 'package:flutter/material.dart';

class PhoneSignIn extends StatefulWidget {
  PhoneSignIn({Key? key}) : super(key: key);

  @override
  State<PhoneSignIn> createState() => _PhoneSignInState();
}

class _PhoneSignInState extends State<PhoneSignIn> {
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Welcome to TNS-HEALTH'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('images/logo.png'),
          ),
          const Text(
            'TNS Health',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: phoneController,
            validator: (value) {
              RegExp regex = RegExp(r'^.{10,}$');
              if (value!.isEmpty) {
                return "Please Enter your Mobile No.";
              }
              if (!regex.hasMatch(value)) {
                return "Please Enter 10 digit mobile number";
              }
            },
            onSaved: (value) {
              value = phoneController.text;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone),
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Verify'),
            icon: const Icon(Icons.forward),
          )
        ],
      ),
    );
  }
}
