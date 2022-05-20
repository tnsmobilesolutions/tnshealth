import 'dart:convert';

class Orders {
  final String? orderId;
  final String? orderDate;
  final String? orderTime;
  final String? deliveryDate;
  final String? deliveryTime;
  final String? orderAddress;
  Orders({
    this.orderId,
    this.orderDate,
    this.orderTime,
    this.deliveryDate,
    this.deliveryTime,
    this.orderAddress,
  });

  Orders copyWith({
    String? orderId,
    String? orderDate,
    String? orderTime,
    String? deliveryDate,
    String? deliveryTime,
    String? orderAddress,
  }) {
    return Orders(
      orderId: orderId ?? this.orderId,
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
      'orderDate': orderDate,
      'orderTime': orderTime,
      'deliveryDate': deliveryDate,
      'deliveryTime': deliveryTime,
      'orderAddress': orderAddress,
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      orderId: map['orderId'],
      orderDate: map['orderDate'],
      orderTime: map['orderTime'],
      deliveryDate: map['deliveryDate'],
      deliveryTime: map['deliveryTime'],
      orderAddress: map['orderAddress'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Orders.fromJson(String source) => Orders.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Orders(orderId: $orderId, orderDate: $orderDate, orderTime: $orderTime, deliveryDate: $deliveryDate, deliveryTime: $deliveryTime, orderAddress: $orderAddress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Orders &&
        other.orderId == orderId &&
        other.orderDate == orderDate &&
        other.orderTime == orderTime &&
        other.deliveryDate == deliveryDate &&
        other.deliveryTime == deliveryTime &&
        other.orderAddress == orderAddress;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        orderDate.hashCode ^
        orderTime.hashCode ^
        deliveryDate.hashCode ^
        deliveryTime.hashCode ^
        orderAddress.hashCode;
  }
}
