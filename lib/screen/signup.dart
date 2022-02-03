import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tnshealth/screen/Dashboard.dart';

enum SingingCharacter { Male, Female }

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  final fullnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  final phonenumbercontroller = TextEditingController();

  final kTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  SingingCharacter? _character = SingingCharacter.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Your Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: fullnamecontroller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    hintText: 'Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(height: 20),
              // Text('Patient Name', style: kTabBar),
              // const SizedBox(height: 20),
              TextFormField(
                controller: agecontroller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    hintText: 'Age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              // const SizedBox(height: 20),
              // Row(
              //   children: [
              //     RadioListTile<SingingCharacter>(
              //       title: const Text('Male'),
              //       value: SingingCharacter.Male,
              //       groupValue: _character,
              //       onChanged: (SingingCharacter? value) {
              //         setState(() {
              //           _character = value;
              //         });
              //       },
              //     ),
              //     RadioListTile<SingingCharacter>(
              //       title: const Text('Female'),
              //       value: SingingCharacter.Female,
              //       groupValue: _character,
              //       onChanged: (SingingCharacter? value) {
              //         setState(() {
              //           _character = value;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    hintText: 'Email Id',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: confirmpasswordcontroller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
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
                      print(fullnamecontroller.text);
                      print(agecontroller.text);
                      print(emailcontroller.text);
                      print(passwordcontroller.text);
                      print(confirmpasswordcontroller.text);

                      print(phonenumbercontroller.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    },
                    child: const Text(
                      'Update',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
