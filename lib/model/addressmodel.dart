import 'dart:convert';

class Address {
  final String? patientName;
  final String? addressId;
  final String? addressLine1;
  final String? addressLine2;
  final String? addressType;
  final String? city;
  final String? state;
  final int? pincode;
  final int? phoneNumber;

  Address({
    this.patientName,
    this.addressId,
    this.addressLine1,
    this.addressLine2,
    this.addressType,
    this.city,
    this.state,
    this.pincode,
    this.phoneNumber,
  });

  Address copyWith({
    String? patientName,
    String? addressId,
    String? addressLine1,
    String? addressLine2,
    String? addressType,
    String? city,
    String? state,
    int? pincode,
    int? phoneNumber,
  }) {
    return Address(
      patientName: patientName ?? this.patientName,
      addressId: addressId ?? this.addressId,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      addressType: addressType ?? this.addressType,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (patientName != null) {
      result.addAll({'patientName': patientName});
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
    if (addressType != null) {
      result.addAll({'addressType': addressType});
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
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }

    return result;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      patientName: map['patientName'],
      addressId: map['addressId'],
      addressLine1: map['addressLine1'],
      addressLine2: map['addressLine2'],
      addressType: map['addressType'],
      city: map['city'],
      state: map['state'],
      pincode: map['pincode']?.toInt(),
      phoneNumber: map['phoneNumber']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(patientName: $patientName, addressId: $addressId, addressLine1: $addressLine1, addressLine2: $addressLine2, addressType: $addressType, city: $city, state: $state, pincode: $pincode, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.patientName == patientName &&
        other.addressId == addressId &&
        other.addressLine1 == addressLine1 &&
        other.addressLine2 == addressLine2 &&
        other.addressType == addressType &&
        other.city == city &&
        other.state == state &&
        other.pincode == pincode &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return patientName.hashCode ^
        addressId.hashCode ^
        addressLine1.hashCode ^
        addressLine2.hashCode ^
        addressType.hashCode ^
        city.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        phoneNumber.hashCode;
  }
}
