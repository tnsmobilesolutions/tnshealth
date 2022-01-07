import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tnshealth/screen/Dashboard.dart';

class medicine extends StatefulWidget {
  medicine({Key? key}) : super(key: key);

  @override
  _medicineState createState() => _medicineState();
}

class _medicineState extends State<medicine> {
  final kTextStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String dropdownValue = 'Allopathy';
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: DropdownButton<String>(
                value: dropdownValue,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 3,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Allopathy', 'Ayurvedic', 'Homeopathy']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Text('Upload Prescription', style: kTabBar),

            const SizedBox(height: 20),
            Text('Delivery Adress', style: kTabBar),
            // const SizedBox(height: 20),

            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adress Line 1',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adress Line 2',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'State',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'PinCode',
              ),
            ),
            const SizedBox(height: 20),
            // Text('Mobile No.', style: kTabBar),
            // const SizedBox(height: 20),
            IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    DashBoard();
                  },
                  child: const Text(
                    'Order',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
