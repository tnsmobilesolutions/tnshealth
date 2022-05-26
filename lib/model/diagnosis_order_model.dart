// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tnshealth/model/addressmodel.dart';

class DiagnosisOrder {
  final String? diagnosisOrderId;
  final String? diagnosisName;
  final Address? diagnosisOrderAddress;

  DiagnosisOrder({
    this.diagnosisOrderId,
    this.diagnosisName,
    this.diagnosisOrderAddress,
  });

  DiagnosisOrder copyWith({
    String? diagnosisOrderId,
    String? diagnosisName,
    Address? diagnosisOrderAddress,
  }) {
    return DiagnosisOrder(
      diagnosisOrderId: diagnosisOrderId ?? this.diagnosisOrderId,
      diagnosisName: diagnosisName ?? this.diagnosisName,
      diagnosisOrderAddress:
          diagnosisOrderAddress ?? this.diagnosisOrderAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'diagnosisOrderId': diagnosisOrderId,
      'diagnosisName': diagnosisName,
      'diagnosisOrderAddress': diagnosisOrderAddress?.toMap(),
    };
  }

  factory DiagnosisOrder.fromMap(Map<String, dynamic> map) {
    return DiagnosisOrder(
      diagnosisOrderId: map['diagnosisOrderId'] != null
          ? map['diagnosisOrderId'] as String
          : null,
      diagnosisName:
          map['diagnosisName'] != null ? map['diagnosisName'] as String : null,
      diagnosisOrderAddress: map['diagnosisOrderAddress'] != null
          ? Address.fromMap(
              map['diagnosisOrderAddress'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiagnosisOrder.fromJson(String source) =>
      DiagnosisOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DiagnosisOrder(diagnosisOrderId: $diagnosisOrderId, diagnosisName: $diagnosisName, diagnosisOrderAddress: $diagnosisOrderAddress)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiagnosisOrder &&
        other.diagnosisOrderId == diagnosisOrderId &&
        other.diagnosisName == diagnosisName &&
        other.diagnosisOrderAddress == diagnosisOrderAddress;
  }

  @override
  int get hashCode =>
      diagnosisOrderId.hashCode ^
      diagnosisName.hashCode ^
      diagnosisOrderAddress.hashCode;
}
