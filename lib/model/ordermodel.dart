import 'dart:convert';

import 'package:tnshealth/model/addressmodel.dart';

class Order {
  Order({
    this.deliveryDate,
    this.deliveryTime,
    this.orderAddress,
    this.orderDate,
    this.orderId,
    this.orderTime,
    this.prescriptionURL,
    this.userId,
    this.vendorId,
  });

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      deliveryDate: map['deliveryDate'],
      deliveryTime: map['deliveryTime'],
      orderAddress: map['orderAddress'] != null
          ? Address.fromMap(map['orderAddress'])
          : null,
      orderDate: map['orderDate'],
      orderId: map['orderId'],
      orderTime: map['orderTime'],
      prescriptionURL: map['prescriptionURL'],
      userId: map['userId'],
      vendorId: map['vendorId'],
    );
  }

  final String? deliveryDate;
  final String? deliveryTime;
  final Address? orderAddress;
  final String? orderDate;
  final String? orderId;
  final String? orderTime;
  final String? prescriptionURL;
  final String? userId;
  final String? vendorId;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.deliveryDate == deliveryDate &&
        other.deliveryTime == deliveryTime &&
        other.orderAddress == orderAddress &&
        other.orderDate == orderDate &&
        other.orderId == orderId &&
        other.orderTime == orderTime &&
        other.prescriptionURL == prescriptionURL &&
        other.userId == userId &&
        other.vendorId == vendorId;
  }

  @override
  int get hashCode {
    return deliveryDate.hashCode ^
        deliveryTime.hashCode ^
        orderAddress.hashCode ^
        orderDate.hashCode ^
        orderId.hashCode ^
        orderTime.hashCode ^
        prescriptionURL.hashCode ^
        userId.hashCode ^
        vendorId.hashCode;
  }

  @override
  String toString() {
    return 'Orders(deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, orderAddress: $orderAddress, orderDate: $orderDate, orderId: $orderId, orderTime: $orderTime, prescriptionURL: $prescriptionURL, userId: $userId, vendorId: $vendorId)';
  }

  Order copyWith({
    String? deliveryDate,
    String? deliveryTime,
    Address? orderAddress,
    String? orderDate,
    String? orderId,
    String? orderTime,
    String? prescriptionURL,
    String? userId,
    String? vendorId,
  }) {
    return Order(
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      orderAddress: orderAddress ?? this.orderAddress,
      orderDate: orderDate ?? this.orderDate,
      orderId: orderId ?? this.orderId,
      orderTime: orderTime ?? this.orderTime,
      prescriptionURL: prescriptionURL ?? this.prescriptionURL,
      userId: userId ?? this.userId,
      vendorId: vendorId ?? this.vendorId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deliveryDate': deliveryDate,
      'deliveryTime': deliveryTime,
      'orderAddress': orderAddress?.toMap(),
      'orderDate': orderDate,
      'orderId': orderId,
      'orderTime': orderTime,
      'prescriptionURL': prescriptionURL,
      'userId': userId,
      'vendorId': vendorId,
    };
  }

  String toJson() => json.encode(toMap());
}
