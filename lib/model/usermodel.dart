import 'dart:convert';

class AppUser {
  String? uid;
  String? name;
  String? phonenumber;
  String? email;
  String? gender;
  String? bloodgroup;
  String? maritialstatus;
  String? height;
  String? weight;
  String? address;
  AppUser({
    this.uid,
    this.name,
    this.phonenumber,
    this.email,
    this.gender,
    this.bloodgroup,
    this.maritialstatus,
    this.height,
    this.weight,
    this.address,
  });

  AppUser copyWith({
    String? uid,
    String? name,
    String? phonenumber,
    String? email,
    String? gender,
    String? bloodgroup,
    String? maritialstatus,
    String? height,
    String? weight,
    String? address,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      maritialstatus: maritialstatus ?? this.maritialstatus,
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
    if (name != null) {
      result.addAll({'name': name});
    }
    if (phonenumber != null) {
      result.addAll({'phonenumber': phonenumber});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (bloodgroup != null) {
      result.addAll({'bloodgroup': bloodgroup});
    }
    if (maritialstatus != null) {
      result.addAll({'maritialstatus': maritialstatus});
    }
    if (height != null) {
      result.addAll({'height': height});
    }
    if (weight != null) {
      result.addAll({'weight': weight});
    }
    if (address != null) {
      result.addAll({'address': address});
    }

    return result;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      name: map['name'],
      phonenumber: map['phonenumber'],
      email: map['email'],
      gender: map['gender'],
      bloodgroup: map['bloodgroup'],
      maritialstatus: map['maritialstatus'],
      height: map['height'],
      weight: map['weight'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(uid: $uid, name: $name, phonenumber: $phonenumber, email: $email, gender: $gender, bloodgroup: $bloodgroup, maritialstatus: $maritialstatus, height: $height, weight: $weight, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.uid == uid &&
        other.name == name &&
        other.phonenumber == phonenumber &&
        other.email == email &&
        other.gender == gender &&
        other.bloodgroup == bloodgroup &&
        other.maritialstatus == maritialstatus &&
        other.height == height &&
        other.weight == weight &&
        other.address == address;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        phonenumber.hashCode ^
        email.hashCode ^
        gender.hashCode ^
        bloodgroup.hashCode ^
        maritialstatus.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        address.hashCode;
  }
}
