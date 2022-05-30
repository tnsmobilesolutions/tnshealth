import 'package:flutter/material.dart';
import 'package:tnshealth/model/addressmodel.dart';

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
        title: const Text('Address'),
      ),
    );
  }
}
