import 'package:flutter/material.dart';

import 'package:tnshealth/API/userAPI.dart';
import 'package:tnshealth/model/addressmodel.dart';
import 'package:tnshealth/model/usermodel.dart';

import 'package:tnshealth/screen/Dashboard.dart';
import 'package:uuid/uuid.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final fullnamecontroller = TextEditingController();
  final dobcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final addressline1namecontroller = TextEditingController();
  final addressline2namecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final bloodgroupcontroller = TextEditingController();
  final heightcontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  final addresstypecontroller = TextEditingController();
  final countrycontroller = TextEditingController();

  final kTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//signup button

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to TNS Health'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: fullnamecontroller,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{3,}[a-z A-Z]$');
                    if (value == null || value.isEmpty) {
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
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailcontroller.text = value!;
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Email Id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  controller: heightcontroller,
                  onSaved: (value) {
                    heightcontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.height),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Height",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  controller: weightcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    weightcontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.monitor_weight),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Weight",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  // keyboardType: TextInputType.none,
                  autofocus: false,
                  controller: gendercontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter gender';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    gendercontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.male),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Gender",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  // keyboardType: TextInputType.none,
                  autofocus: false,
                  controller: bloodgroupcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bloodgroup';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    bloodgroupcontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.bloodtype),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "BloodGroup",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: addressline1namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                    labelText: 'Address Line 1',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: addressline2namecontroller,
                  //   validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter test name';
                  //   }
                  //   return null;
                  // },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                    labelText: 'Adress Line 2',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: citycontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                    labelText: 'City',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: statecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.my_location),
                    border: OutlineInputBorder(),
                    labelText: 'State',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your valid pincode';
                    }
                    return null;
                  },
                  controller: pincodecontroller,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_pin),
                    border: OutlineInputBorder(),
                    labelText: 'PinCode',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: addresstypecontroller,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_searching),
                    border: OutlineInputBorder(),
                    labelText: 'Address Type',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                  controller: countrycontroller,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.my_location),
                    border: OutlineInputBorder(),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{10,}$');
                    if (value!.isEmpty) {
                      return ("Please enter Phone Number");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter 10 Digit Mobile Number");
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
                // IntlPhoneField(
                //   textInputAction: TextInputAction.next,
                //   validator: (value) {
                //     RegExp regex = RegExp(r'^.{10,}$');
                //     if (value!.isEmpty) {
                //       return ("phone number cannot be Empty");
                //     }
                //     if (!regex.hasMatch(value)) {
                //       return ("Enter Valid name(Min. 10 Character)");
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     phonenumbercontroller.text = value!.toString();
                //   },
                //   controller: phonenumbercontroller,
                //   decoration: const InputDecoration(
                //     labelText: 'Phone Number',
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide(),
                //     ),
                //   ),
                //   initialCountryCode: 'IN',
                //   onChanged: (phone) {
                //     // print(phone.completeNumber);
                //   },
                // ),
                const SizedBox(height: 20),
                TextFormField(
                  autofocus: false,
                  controller: passwordcontroller,
                  obscureText: true,
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Password is required for login");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password(Min. 6 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passwordcontroller.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.password),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autofocus: false,
                  controller: confirmpasswordcontroller,
                  obscureText: true,
                  validator: (value) {
                    if (confirmpasswordcontroller.text !=
                        passwordcontroller.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    confirmpasswordcontroller.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.password),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.redAccent,
                  child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AppUser _appUser = AppUser(
                            name: fullnamecontroller.text.trim(),
                            email: emailcontroller.text.trim(),
                            country: countrycontroller.text,
                            phoneNumber: phonenumbercontroller.text.trim(),
                            userId: const Uuid().v1(),
                            address: [
                              Address(
                                patientName: fullnamecontroller.text.trim(),
                                addressId: const Uuid().v1(),
                                addressLine1: addressline1namecontroller.text,
                                addressLine2: addressline2namecontroller.text,
                                addressType: addresstypecontroller.text,
                                city: citycontroller.text,
                                state: statecontroller.text,
                                pincode: int.tryParse(pincodecontroller.text),
                                phoneNumber:
                                    int.tryParse(phonenumbercontroller.text),
                              )
                            ],
                            bloodGroup: bloodgroupcontroller.text,
                            gender: gendercontroller.text,
                            height: heightcontroller.text,
                            weight: weightcontroller.text,
                          );

                          userAPI()
                              .signUp(_appUser, passwordcontroller.text.trim());
                          if (_appUser != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    Theme.of(context).iconTheme.color,
                                behavior: SnackBarBehavior.floating,
                                content:
                                    const Text('Account created successfully'),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashBoard(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:
                                    Theme.of(context).iconTheme.color,
                                behavior: SnackBarBehavior.floating,
                                content: const Text('Account already exists'),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "SignUp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
