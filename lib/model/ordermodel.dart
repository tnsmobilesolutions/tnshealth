import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tnshealth/model/addressmodel.dart';

class Order {
  Order({
    this.deliveryDate,
    this.deliveryTime,
    this.address,
    this.orderDate,
    this.orderId,
    this.orderTime,
    this.prescriptionURL,
    this.userId,
    this.vendorId,
    this.name,
  });

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      deliveryDate: map['deliveryDate'],
      deliveryTime: map['deliveryTime'],
      address: map['address'] != null
          ? List<Address?>.from(map['address']?.map((x) => Address?.fromMap(x)))
          : null,
      orderDate: map['orderDate'],
      orderId: map['orderId'],
      orderTime: map['orderTime'],
      prescriptionURL: map['prescriptionURL'],
      userId: map['userId'],
      vendorId: map['vendorId'],
      name: map['name'],
    );
  }

  final String? deliveryDate;
  final String? deliveryTime;
  final List<Address?>? address;
  final String? orderDate;
  final String? orderId;
  final String? orderTime;
  final String? prescriptionURL;
  final String? userId;
  final String? vendorId;
  final String? name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.deliveryDate == deliveryDate &&
        other.deliveryTime == deliveryTime &&
        listEquals(other.address, address) &&
        other.orderDate == orderDate &&
        other.orderId == orderId &&
        other.orderTime == orderTime &&
        other.prescriptionURL == prescriptionURL &&
        other.userId == userId &&
        other.vendorId == vendorId &&
        other.name == name;
  }

  @override
  int get hashCode {
    return deliveryDate.hashCode ^
        deliveryTime.hashCode ^
        address.hashCode ^
        orderDate.hashCode ^
        orderId.hashCode ^
        orderTime.hashCode ^
        prescriptionURL.hashCode ^
        userId.hashCode ^
        vendorId.hashCode ^
        name.hashCode;
  }

  @override
  String toString() {
    return 'Order(deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, address: $address, orderDate: $orderDate, orderId: $orderId, orderTime: $orderTime, prescriptionURL: $prescriptionURL, userId: $userId, vendorId: $vendorId, name: $name)';
  }

  Order copyWith({
    String? deliveryDate,
    String? deliveryTime,
    List<Address?>? address,
    String? orderDate,
    String? orderId,
    String? orderTime,
    String? prescriptionURL,
    String? userId,
    String? vendorId,
    String? name,
  }) {
    return Order(
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      address: address ?? this.address,
      orderDate: orderDate ?? this.orderDate,
      orderId: orderId ?? this.orderId,
      orderTime: orderTime ?? this.orderTime,
      prescriptionURL: prescriptionURL ?? this.prescriptionURL,
      userId: userId ?? this.userId,
      vendorId: vendorId ?? this.vendorId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deliveryDate': deliveryDate,
      'deliveryTime': deliveryTime,
      'address': address?.map((x) => x?.toMap()).toList(),
      'orderDate': orderDate,
      'orderId': orderId,
      'orderTime': orderTime,
      'prescriptionURL': prescriptionURL,
      'userId': userId,
      'vendorId': vendorId,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
