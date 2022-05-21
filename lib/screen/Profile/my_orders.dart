import 'package:flutter/material.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.greenAccent,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Id  :  ${uuid.v1()}',
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                      Text(
                        '${orderDetails.keys.toList()[0]}  :  ${orderDetails.values.toList()[0]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${orderDetails.keys.toList()[1]}  :  ${orderDetails.values.toList()[1]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${orderDetails.keys.toList()[2]}  :  ${orderDetails.values.toList()[2]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${orderDetails.keys.toList()[3]}  :  ${orderDetails.values.toList()[3]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${orderDetails.keys.toList()[4]}  :  ${orderDetails.values.toList()[4]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
