// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final String? addressId;
  final String? addressLine1;
  final String? addressLine2;
  final String? addressType;
  final String? city;
  final String? state;
  final int? pincode;
  final int? contactNumber;
  Address({
    this.addressId,
    this.addressLine1,
    this.addressLine2,
    this.addressType,
    this.city,
    this.state,
    this.pincode,
    this.contactNumber,
  });

  Address copyWith({
    String? addressId,
    String? addressLine1,
    String? addressLine2,
    String? addressType,
    String? city,
    String? state,
    int? pincode,
    int? contactNumber,
  }) {
    return Address(
      addressId: addressId ?? this.addressId,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      addressType: addressType ?? this.addressType,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      contactNumber: contactNumber ?? this.contactNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addressId': addressId,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'addressType': addressType,
      'city': city,
      'state': state,
      'pincode': pincode,
      'contactNumber': contactNumber,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      addressId: map['addressId'],
      addressLine1: map['addressLine1'],
      addressLine2: map['addressLine2'],
      addressType: map['addressType'],
      city: map['city'],
      state: map['state'],
      pincode: map['pincode']?.toInt(),
      contactNumber: map['contactNumber']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(addressId: $addressId, addressLine1: $addressLine1, addressLine2: $addressLine2, addressType: $addressType, city: $city, state: $state, pincode: $pincode, contactNumber: $contactNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.addressId == addressId &&
        other.addressLine1 == addressLine1 &&
        other.addressLine2 == addressLine2 &&
        other.addressType == addressType &&
        other.city == city &&
        other.state == state &&
        other.pincode == pincode &&
        other.contactNumber == contactNumber;
  }

  @override
  int get hashCode {
    return addressId.hashCode ^
        addressLine1.hashCode ^
        addressLine2.hashCode ^
        addressType.hashCode ^
        city.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        contactNumber.hashCode;
  }
}
