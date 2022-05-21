import 'dart:convert';

class Adsress {
  final String? addressId;
  final String? addressLine1;
  final String? addressLine2;
  final String? addressNickName;
  final String? city;
  final String? state;
  final int? pincode;
  final String? contactNumber;
  Adsress({
    this.addressId,
    this.addressLine1,
    this.addressLine2,
    this.addressNickName,
    this.city,
    this.state,
    this.pincode,
    this.contactNumber,
  });

  Adsress copyWith({
    String? addressId,
    String? addressLine1,
    String? addressLine2,
    String? addressNickName,
    String? city,
    String? state,
    int? pincode,
    String? contactNumber,
  }) {
    return Adsress(
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
    return {
      'addressId': addressId,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'addressNickName': addressNickName,
      'city': city,
      'state': state,
      'pincode': pincode,
      'contactNumber': contactNumber,
    };
  }

  factory Adsress.fromMap(Map<String, dynamic> map) {
    return Adsress(
      addressId: map['addressId'],
      addressLine1: map['addressLine1'],
      addressLine2: map['addressLine2'],
      addressNickName: map['addressNickName'],
      city: map['city'],
      state: map['state'],
      pincode: map['pincode']?.toInt(),
      contactNumber: map['contactNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Adsress.fromJson(String source) =>
      Adsress.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Adsress(addressId: $addressId, addressLine1: $addressLine1, addressLine2: $addressLine2, addressNickName: $addressNickName, city: $city, state: $state, pincode: $pincode, contactNumber: $contactNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Adsress &&
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
    return addressId.hashCode ^
        addressLine1.hashCode ^
        addressLine2.hashCode ^
        addressNickName.hashCode ^
        city.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        contactNumber.hashCode;
  }
}
