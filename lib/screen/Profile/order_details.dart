import 'package:flutter/material.dart';
import 'package:tnshealth/widget.dart';
import 'package:uuid/uuid.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails(
      {Key? key,
      this.orderDate,
      this.orderTime,
      this.deliveryDate,
      this.deliveryTime,
      this.orderAddress})
      : super(key: key);

  final String? orderDate;
  final String? orderTime;
  final String? deliveryDate;
  final String? deliveryTime;
  final String? orderAddress;

  @override
  Widget build(BuildContext context) {
    var uuid = const Uuid();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(26, 15, 26, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(),
                const SizedBox(height: 16),
                const Divider(color: Colors.black, thickness: 2.0),
                const SizedBox(height: 16),
                Widgets().myOrders('Order Id  :  ', uuid.v1()),
                const SizedBox(height: 30),
                Widgets().myOrders('Order Date : ', orderDate!),
                const SizedBox(height: 30),
                Widgets().myOrders('Order Time  : ', orderTime!),
                const SizedBox(height: 30),
                Widgets().myOrders('Delivery Date  : ', deliveryDate!),
                const SizedBox(height: 30),
                Widgets().myOrders('Delivery Time  :  ', deliveryTime!),
                const SizedBox(height: 30),
                Widgets().myOrders('Order Address  :  ', orderAddress!),
                const SizedBox(height: 16),
                const Divider(color: Colors.black, thickness: 2.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
