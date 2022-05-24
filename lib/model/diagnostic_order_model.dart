// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:tnshealth/model/addressmodel.dart';

class DiagnosticOrder {
  final String? diagnosticOrderId;
  final String? diagnosticName;
  final String? patientName;
  final Address? diagnosticOrderAddress;

  DiagnosticOrder({
    this.diagnosticOrderId,
    this.diagnosticName,
    this.patientName,
    this.diagnosticOrderAddress,
  });

  DiagnosticOrder copyWith({
    String? diagnosticOrderId,
    String? diagnosticName,
    String? patientName,
    Address? diagnosticOrderAddress,
  }) {
    return DiagnosticOrder(
      diagnosticOrderId: diagnosticOrderId ?? this.diagnosticOrderId,
      diagnosticName: diagnosticName ?? this.diagnosticName,
      patientName: patientName ?? this.patientName,
      diagnosticOrderAddress:
          diagnosticOrderAddress ?? this.diagnosticOrderAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'diagnosticOrderId': diagnosticOrderId,
      'diagnosticName': diagnosticName,
      'patientName': patientName,
      'diagnosticOrderAddress': diagnosticOrderAddress?.toMap(),
    };
  }

  factory DiagnosticOrder.fromMap(Map<String, dynamic> map) {
    return DiagnosticOrder(
      diagnosticOrderId: map['diagnosticOrderId'] != null
          ? map['diagnosticOrderId'] as String
          : null,
      diagnosticName: map['diagnosticName'] != null
          ? map['diagnosticName'] as String
          : null,
      patientName:
          map['patientName'] != null ? map['patientName'] as String : null,
      diagnosticOrderAddress: map['diagnosticOrderAddress'] != null
          ? Address.fromMap(
              map['diagnosticOrderAddress'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiagnosticOrder.fromJson(String source) =>
      DiagnosticOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DiagnosticOrder(diagnosticOrderId: $diagnosticOrderId, diagnosticName: $diagnosticName, patientName: $patientName, diagnosticOrderAddress: $diagnosticOrderAddress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiagnosticOrder &&
        other.diagnosticOrderId == diagnosticOrderId &&
        other.diagnosticName == diagnosticName &&
        other.patientName == patientName &&
        other.diagnosticOrderAddress == diagnosticOrderAddress;
  }

  @override
  int get hashCode {
    return diagnosticOrderId.hashCode ^
        diagnosticName.hashCode ^
        patientName.hashCode ^
        diagnosticOrderAddress.hashCode;
  }
}
