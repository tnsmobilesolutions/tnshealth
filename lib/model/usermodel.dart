import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:healthshared/models/address_model.dart';

class AppUser {
  String? uid;
  String? userId;
  String? name;
  String? phoneNumber;
  String? country;
  String? email;
  String? gender;
  String? bloodGroup;
  String? height;
  String? weight;
  List<Address?>? address;
  AppUser({
    this.uid,
    this.userId,
    this.name,
    this.phoneNumber,
    this.country,
    this.email,
    this.gender,
    this.bloodGroup,
    this.height,
    this.weight,
    this.address,
  });

  AppUser copyWith({
    String? uid,
    String? userId,
    String? name,
    String? phoneNumber,
    String? country,
    String? email,
    String? gender,
    String? bloodGroup,
    String? height,
    String? weight,
    List<Address?>? address,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (uid != null) {
      result.addAll({'uid': uid});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (bloodGroup != null) {
      result.addAll({'bloodGroup': bloodGroup});
    }
    if (height != null) {
      result.addAll({'height': height});
    }
    if (weight != null) {
      result.addAll({'weight': weight});
    }
    if (address != null) {
      result.addAll({'address': address!.map((x) => x?.toMap()).toList()});
    }

    return result;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      userId: map['userId'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      country: map['country'],
      email: map['email'],
      gender: map['gender'],
      bloodGroup: map['bloodGroup'],
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
    return 'AppUser(uid: $uid, userId: $userId, name: $name, phoneNumber: $phoneNumber, country: $country, email: $email, gender: $gender, bloodGroup: $bloodGroup, height: $height, weight: $weight, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.uid == uid &&
        other.userId == userId &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.country == country &&
        other.email == email &&
        other.gender == gender &&
        other.bloodGroup == bloodGroup &&
        other.height == height &&
        other.weight == weight &&
        listEquals(other.address, address);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        userId.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        country.hashCode ^
        email.hashCode ^
        gender.hashCode ^
        bloodGroup.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        address.hashCode;
  }
}
