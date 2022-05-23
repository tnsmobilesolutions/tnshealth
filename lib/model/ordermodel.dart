import 'dart:convert';

class Orders {
  Orders({
    this.orderId,
    this.userId,
    this.vendorId,
    this.prescriptionURL,
    this.orderDate,
    this.orderTime,
    this.deliveryDate,
    this.deliveryTime,
    this.orderAddress,
  });

  factory Orders.fromJson(String source) => Orders.fromMap(json.decode(source));

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      orderId: map['orderId'],
      userId: map['userId'],
      vendorId: map['vendorId'],
      prescriptionURL: map['prescriptionURL'],
      orderDate: map['orderDate'],
      orderTime: map['orderTime'],
      deliveryDate: map['deliveryDate'],
      deliveryTime: map['deliveryTime'],
      orderAddress: map['orderAddress'],
    );
  }

  final String? deliveryDate;
  final String? deliveryTime;
  final String? orderAddress;
  final String? orderDate;
  final String? orderId;
  final String? orderTime;
  final String? prescriptionURL;
  final String? userId;
  final String? vendorId;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Orders &&
        other.orderId == orderId &&
        other.userId == userId &&
        other.vendorId == vendorId &&
        other.prescriptionURL == prescriptionURL &&
        other.orderDate == orderDate &&
        other.orderTime == orderTime &&
        other.deliveryDate == deliveryDate &&
        other.deliveryTime == deliveryTime &&
        other.orderAddress == orderAddress;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        userId.hashCode ^
        vendorId.hashCode ^
        prescriptionURL.hashCode ^
        orderDate.hashCode ^
        orderTime.hashCode ^
        deliveryDate.hashCode ^
        deliveryTime.hashCode ^
        orderAddress.hashCode;
  }

  @override
  String toString() {
    return 'Orders(orderId: $orderId, userId: $userId, vendorId: $vendorId, prescriptionURL: $prescriptionURL, orderDate: $orderDate, orderTime: $orderTime, deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, orderAddress: $orderAddress)';
  }

  Orders copyWith({
    String? orderId,
    String? userId,
    String? vendorId,
    String? prescriptionURL,
    String? orderDate,
    String? orderTime,
    String? deliveryDate,
    String? deliveryTime,
    String? orderAddress,
  }) {
    return Orders(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      vendorId: vendorId ?? this.vendorId,
      prescriptionURL: prescriptionURL ?? this.prescriptionURL,
      orderDate: orderDate ?? this.orderDate,
      orderTime: orderTime ?? this.orderTime,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      orderAddress: orderAddress ?? this.orderAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'vendorId': vendorId,
      'prescriptionURL': prescriptionURL,
      'orderDate': orderDate,
      'orderTime': orderTime,
      'deliveryDate': deliveryDate,
      'deliveryTime': deliveryTime,
      'orderAddress': orderAddress,
    };
  }

  String toJson() => json.encode(toMap());
}
