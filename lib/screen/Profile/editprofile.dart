import 'package:flutter/cupertino.dart';
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
  final namecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  final dateofbirthcontroller = TextEditingController();
  final bloodgroupcontroller = TextEditingController();
  final maritialcontroller = TextEditingController();
  final heightcontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  final adresscontroller = TextEditingController();

  final kTextStyle = const TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
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
                  radius: 50.0,
                  backgroundImage: AssetImage('images/ben10.jpg'),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 10),
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

              const SizedBox(height: 10),
              TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Id',
                ),
              ),
              const SizedBox(height: 10),
              // Text('Patient Name', style: kTabBar),
              // const SizedBox(height: 10),
              TextField(
                controller: gendercontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gender',
                ),
              ),
              // const SizedBox(height: 10),
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

              const SizedBox(height: 10),
              TextField(
                // onTap: () {
                //   Container(
                //     height: 100,
                //     child: CupertinoDatePicker(
                //       mode: CupertinoDatePickerMode.date,
                //       initialDateTime: DateTime(1969, 1, 1),
                //       onDateTimeChanged: (DateTime newDateTime) {
                //         // Do something
                //       },
                //     ),
                //   );
                // },
                controller: dateofbirthcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date Of Birth',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: bloodgroupcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Blood Group',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: maritialcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Marital Status',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: heightcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Height',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: weightcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'weight',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: adresscontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Defalult Adress',
                ),
              ),
              const SizedBox(height: 10),

              // Text('Mobile No.', style: kTabBar),
              // const SizedBox(height: 10),

              Center(
                child: ElevatedButton(
                    onPressed: () {
                      print(namecontroller.text);
                      print(gendercontroller.text);
                      print(emailcontroller.text);

                      print(phonenumbercontroller.text);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Profile(
                            name: namecontroller.text,
                            phonenum: phonenumbercontroller.text,
                            emailid: emailcontroller.text,
                            gender: gendercontroller.text,
                            dateofbirth: dateofbirthcontroller.text,
                            bloodgroup: bloodgroupcontroller.text,
                            maritial: maritialcontroller.text,
                            height: heightcontroller.text,
                            weight: weightcontroller.text,
                            adress: adresscontroller.text,
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
