import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tnshealth/screen/Dashboard.dart';

class diagnosys extends StatefulWidget {
  diagnosys({Key? key}) : super(key: key);

  @override
  _diagnosysState createState() => _diagnosysState();
}

class _diagnosysState extends State<diagnosys> {
  final kTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text('Test Name', style: kTabBar),
            // const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Test Name',
              ),
            ),
            const SizedBox(height: 20),
            // Text('Patient Name', style: kTabBar),
            // const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Patient Name',
              ),
            ),
            const SizedBox(height: 20),
            Text('Patient Adress', style: kTabBar),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adress Line 1',
              ),
            ),
            const SizedBox(height: 5),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adress Line 2',
              ),
            ),
            const SizedBox(height: 5),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
              ),
            ),
            const SizedBox(height: 5),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'State',
              ),
            ),
            const SizedBox(height: 5),
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
                    'Book Appointment',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
