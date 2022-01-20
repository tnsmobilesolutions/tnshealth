import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tnshealth/screen/Dashboard.dart';
import 'package:tnshealth/screen/Profile/profile.dart';

enum SingingCharacter { Male, Female }

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
        title: Text('Edit-Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/ben10.jpg'),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: fullnamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
              ),
              const SizedBox(height: 20),
              // Text('Patient Name', style: kTabBar),
              // const SizedBox(height: 20),
              TextField(
                controller: agecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
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
              TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email-Id',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Old Password',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' Confirm Password',
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
                      print(fullnamecontroller.text);
                      print(agecontroller.text);
                      print(emailcontroller.text);
                      print(passwordcontroller.text);
                      print(confirmpasswordcontroller.text);

                      print(phonenumbercontroller.text);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Profile(
                            fullname: fullnamecontroller.text,
                            age: agecontroller.text,
                            emailid: emailcontroller.text,
                            password: passwordcontroller.text,
                            phonenum: phonenumbercontroller.text,
                          );
                        },
                      ));
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
