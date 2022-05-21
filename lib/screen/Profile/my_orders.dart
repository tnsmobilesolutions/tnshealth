import 'package:flutter/material.dart';
import 'package:tnshealth/widget.dart';
import 'package:uuid/uuid.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uuid = const Uuid();

    final orderDetails = <String, String>{
      'orderDate': '20/05/2022',
      'orderTime': '7.54 PM',
      'deliveryDate': '21/05/2022',
      'deliveryTime': '9.38 AM',
      'orderAddress':
          'Plot - 626 / 979, AT - Naharkanta, PO - Balianta, PS - Hanshpal, Bhubaneswar, pin - 752101'
    };
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Orders'),
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
                Widgets().myOrders('${orderDetails.keys.toList()[0]}  : ',
                    ' ${orderDetails.values.toList()[0]}'),
                const SizedBox(height: 30),
                Widgets().myOrders('${orderDetails.keys.toList()[1]}  : ',
                    ' ${orderDetails.values.toList()[1]}'),
                const SizedBox(height: 30),
                Widgets().myOrders('${orderDetails.keys.toList()[2]}  : ',
                    ' ${orderDetails.values.toList()[2]}'),
                const SizedBox(height: 30),
                Widgets().myOrders('${orderDetails.keys.toList()[3]}  :  ',
                    orderDetails.values.toList()[3]),
                const SizedBox(height: 30),
                Widgets().myOrders('${orderDetails.keys.toList()[4]}  :  ',
                    orderDetails.values.toList()[4]),
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
