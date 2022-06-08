import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tnshealth/model/addressmodel.dart';

class AppUser {
  String? uid;
  String? userID;
  String? name;
  String? phonenumber;
  String? email;
  String? gender;
  String? bloodgroup;
  String? height;
  String? weight;
  List<Address?>? address;
  // String? addressLine1;
  // String? addressLine2;
  // String? city;
  // String? state;
  // String? pincode;
  // String? contactNumber;
  AppUser({
    this.uid,
    this.userID,
    this.name,
    this.phonenumber,
    this.email,
    this.gender,
    this.bloodgroup,
    this.height,
    this.weight,
    this.address,
  });

  AppUser copyWith({
    String? uid,
    String? userID,
    String? name,
    String? phonenumber,
    String? email,
    String? gender,
    String? bloodgroup,
    String? height,
    String? weight,
    List<Address?>? address,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      userID: userID ?? this.userID,
      name: name ?? this.name,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userID': userID,
      'name': name,
      'phonenumber': phonenumber,
      'email': email,
      'gender': gender,
      'bloodgroup': bloodgroup,
      'height': height,
      'weight': weight,
      'address': address?.map((x) => x?.toMap()).toList(),
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      userID: map['userID'],
      name: map['name'],
      phonenumber: map['phonenumber'],
      email: map['email'],
      gender: map['gender'],
      bloodgroup: map['bloodgroup'],
      height: map['height'],
      weight: map['weight'],
      address: map['address'] != null
          ? List<Address?>.from(map['address']?.map((x) => Address?.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(uid: $uid, userID: $userID, name: $name, phonenumber: $phonenumber, email: $email, gender: $gender, bloodgroup: $bloodgroup, height: $height, weight: $weight, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.uid == uid &&
        other.userID == userID &&
        other.name == name &&
        other.phonenumber == phonenumber &&
        other.email == email &&
        other.gender == gender &&
        other.bloodgroup == bloodgroup &&
        other.height == height &&
        other.weight == weight &&
        listEquals(other.address, address);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        userID.hashCode ^
        name.hashCode ^
        phonenumber.hashCode ^
        email.hashCode ^
        gender.hashCode ^
        bloodgroup.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        address.hashCode;
  }
}
