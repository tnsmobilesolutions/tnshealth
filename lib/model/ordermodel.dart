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
    this.name,
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
      name: map['name'],
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
  final String? name;

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
        other.vendorId == vendorId &&
        other.name == name;
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
        vendorId.hashCode ^
        name.hashCode;
  }

  @override
  String toString() {
    return 'Order(deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, orderAddress: $orderAddress, orderDate: $orderDate, orderId: $orderId, orderTime: $orderTime, prescriptionURL: $prescriptionURL, userId: $userId, vendorId: $vendorId, name: $name)';
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
    String? name,
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
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (deliveryDate != null) {
      result.addAll({'deliveryDate': deliveryDate});
    }
    if (deliveryTime != null) {
      result.addAll({'deliveryTime': deliveryTime});
    }
    if (orderAddress != null) {
      result.addAll({'orderAddress': orderAddress!.toMap()});
    }
    if (orderDate != null) {
      result.addAll({'orderDate': orderDate});
    }
    if (orderId != null) {
      result.addAll({'orderId': orderId});
    }
    if (orderTime != null) {
      result.addAll({'orderTime': orderTime});
    }
    if (prescriptionURL != null) {
      result.addAll({'prescriptionURL': prescriptionURL});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (vendorId != null) {
      result.addAll({'vendorId': vendorId});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  String toJson() => json.encode(toMap());
}
