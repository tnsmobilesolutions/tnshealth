import 'dart:convert';

class Address {
  final String? name;
  final String? addressId;
  final String? addressLine1;
  final String? addressLine2;
  final String? addressNickName;
  final String? city;
  final String? state;
  final int? pincode;
  final int? contactNumber;
  Address({
    this.name,
    this.addressId,
    this.addressLine1,
    this.addressLine2,
    this.addressNickName,
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
    String? addressNickName,
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
      addressNickName: addressNickName ?? this.addressNickName,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      contactNumber: contactNumber ?? this.contactNumber,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (addressId != null) {
      result.addAll({'addressId': addressId});
    }
    if (addressLine1 != null) {
      result.addAll({'addressLine1': addressLine1});
    }
    if (addressLine2 != null) {
      result.addAll({'addressLine2': addressLine2});
    }
    if (addressNickName != null) {
      result.addAll({'addressNickName': addressNickName});
    }
    if (city != null) {
      result.addAll({'city': city});
    }
    if (state != null) {
      result.addAll({'state': state});
    }
    if (pincode != null) {
      result.addAll({'pincode': pincode});
    }
    if (contactNumber != null) {
      result.addAll({'contactNumber': contactNumber});
    }

    return result;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      name: map['name'],
      addressId: map['addressId'],
      addressLine1: map['addressLine1'],
      addressLine2: map['addressLine2'],
      addressNickName: map['addressNickName'],
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
    return 'Address(name: $name, addressId: $addressId, addressLine1: $addressLine1, addressLine2: $addressLine2, addressNickName: $addressNickName, city: $city, state: $state, pincode: $pincode, contactNumber: $contactNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.name == name &&
        other.addressId == addressId &&
        other.addressLine1 == addressLine1 &&
        other.addressLine2 == addressLine2 &&
        other.addressNickName == addressNickName &&
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
        addressNickName.hashCode ^
        city.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        contactNumber.hashCode;
  }
}
