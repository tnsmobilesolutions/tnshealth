// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final String? name;
  final String? addressId;
  final String? addressLine1;
  final String? addressLine2;
  final String? addressType;
  final String? city;
  final String? state;
  final int? pincode;
  final int? contactNumber;
  Address({
    this.name,
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
    String? name,
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
      name: name ?? this.name,
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
    return <String, dynamic>{
      'name': name,
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
      name: map['name'] != null ? map['name'] as String : null,
      addressId: map['addressId'] != null ? map['addressId'] as String : null,
      addressLine1:
          map['addressLine1'] != null ? map['addressLine1'] as String : null,
      addressLine2:
          map['addressLine2'] != null ? map['addressLine2'] as String : null,
      addressType:
          map['addressType'] != null ? map['addressType'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as int : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(name: $name, addressId: $addressId, addressLine1: $addressLine1, addressLine2: $addressLine2, addressType: $addressType, city: $city, state: $state, pincode: $pincode, contactNumber: $contactNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.name == name &&
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
    return name.hashCode ^
        addressId.hashCode ^
        addressLine1.hashCode ^
        addressLine2.hashCode ^
        addressType.hashCode ^
        city.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        contactNumber.hashCode;
  }
}
