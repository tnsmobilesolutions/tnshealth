import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tnshealth/API/userAPI.dart';

import 'package:tnshealth/screen/Dashboard.dart';

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
  final adresscontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final bloodgroupcontroller = TextEditingController();
  final heightcontroller = TextEditingController();
  final weightcontroller = TextEditingController();
  final gendercontroller = TextEditingController();

  final kTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //namefield

    final name = TextFormField(
      controller: fullnamecontroller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
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
    );

    //emailfield

    final email = TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      controller: emailcontroller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Email Id',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );

    //password field

    final password = TextFormField(
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
      },
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //confirm password field

    final confirmPassword = TextFormField(
      autofocus: false,
      controller: confirmpasswordcontroller,
      obscureText: true,
      validator: (value) {
        if (confirmpasswordcontroller.text != passwordcontroller.text) {
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmpasswordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Height

    final height = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: heightcontroller,
      onSaved: (value) {
        heightcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Height",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final weight = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: weightcontroller,
      onSaved: (value) {
        weightcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Weight",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //bloodGroup

    final bloodGroup = TextFormField(
      // keyboardType: TextInputType.none,
      autofocus: false,
      controller: bloodgroupcontroller,
      onSaved: (value) {
        bloodgroupcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "BloodGroup",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Gender

    final gender = TextFormField(
      // keyboardType: TextInputType.none,
      autofocus: false,
      controller: gendercontroller,
      onSaved: (value) {
        gendercontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Gender",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Adress

    final adress = TextFormField(
      // keyboardType: TextInputType.none,
      autofocus: false,
      controller: adresscontroller,
      onSaved: (value) {
        adresscontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Adress",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            final _appUser = userAPI().signUp(
                emailcontroller.text,
                passwordcontroller.text,
                fullnamecontroller.text,
                phonenumbercontroller.text,
                adresscontroller.text,
                bloodgroupcontroller.text,
                heightcontroller.text,
                weightcontroller.text,
                gendercontroller.text);
            if (_appUser != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).iconTheme.color,
                  behavior: SnackBarBehavior.floating,
                  content: const Text('Account created successfully'),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashBoard(),
                ),
              );
            } else {
              print('AppUser is null');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).iconTheme.color,
                  behavior: SnackBarBehavior.floating,
                  content: const Text('Account already exists'),
                ),
              );
            }
          },
          child: const Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

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
                name,
                const SizedBox(height: 20),
                email,
                const SizedBox(height: 20),
                height,
                const SizedBox(height: 20),
                weight,
                const SizedBox(height: 20),
                gender,
                const SizedBox(height: 20),
                bloodGroup,
                const SizedBox(height: 20),
                adress,
                const SizedBox(height: 20),
                IntlPhoneField(
                  validator: (value) {
                    RegExp regex = RegExp(r'^.{10,}$');
                    if (value!.isEmpty) {
                      return ("phone number cannot be Empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid name(Min. 10 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phonenumbercontroller.text = value!.toString();
                  },
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
                const SizedBox(height: 20),
                password,
                const SizedBox(height: 20),
                confirmPassword,
                const SizedBox(height: 20),
                signUpButton,
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
