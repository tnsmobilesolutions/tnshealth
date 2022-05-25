import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tnshealth/model/addressmodel.dart';
import 'package:tnshealth/model/diagnostic_order_model.dart';
import 'package:tnshealth/screen/Dashboard.dart';
import 'package:tnshealth/tabbar/consult.dart';
import 'package:uuid/uuid.dart';

class Diagnosys extends StatefulWidget {
  const Diagnosys({Key? key}) : super(key: key);

  @override
  _DiagnosysState createState() => _DiagnosysState();
}

class _DiagnosysState extends State<Diagnosys> {
  final testnamecontroller = TextEditingController();
  final patientnamecontroller = TextEditingController();
  final addressline1namecontroller = TextEditingController();
  final addressline2namecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final addresstypecontroller = TextEditingController();

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
            TextField(
              controller: testnamecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Test Name',
              ),
            ),
            const SizedBox(height: 20),
            // Text('Patient Name', style: kTabBar),
            // const SizedBox(height: 20),
            TextField(
              controller: patientnamecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Patient Name',
              ),
            ),
            const SizedBox(height: 20),
            Text('Patient Address', style: kTabBar),
            const SizedBox(height: 20),
            TextField(
              controller: addressline1namecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address Line 1',
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: addressline2namecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address Line 2',
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: citycontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: statecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'State',
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: addresstypecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address Type',
              ),
            ),

            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.number,
              controller: pincodecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'PinCode',
              ),
            ),
            const SizedBox(height: 20),
            // Text('Mobile No.', style: kTabBar),
            // const SizedBox(height: 20),
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
                // print(phone.completeNumber);
              },
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    DiagnosticOrder diagnosticOrderModel = DiagnosticOrder(
                      diagnosticOrderId: const Uuid().v1(),
                      diagnosticName: testnamecontroller.text,
                      patientName: patientnamecontroller.text,
                      diagnosticOrderAddress: Address(
                        addressId: '67890',
                        addressLine1: addressline1namecontroller.text,
                        addressLine2: addressline2namecontroller.text,
                        addressType: addresstypecontroller.text,
                        city: citycontroller.text,
                        state: statecontroller.text,
                        pincode: int.tryParse(pincodecontroller.text),
                        contactNumber: int.tryParse(phonenumbercontroller.text),
                      ),
                    );
                    print(diagnosticOrderModel);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const DashBoard();
                      },
                    ));
                  },
                  child: const Text(
                    'Book',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
