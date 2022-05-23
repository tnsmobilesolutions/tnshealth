import 'package:flutter/material.dart';

import 'order_details.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<String> orderDetails = [
    '20/05/2022',
    '7.54 PM',
    '21/05/2022',
    '9.38 AM',
    'Plot - 626 / 979, AT - Naharkanta, PO - Balianta, PS - Hanshpal, Bhubaneswar, pin - 752101'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 13),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        textColor: Colors.white,
                        tileColor: Colors.red,
                        title: const Text('Your 1st order'),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetails(
                            orderDate: orderDetails[0],
                            orderTime: orderDetails[1],
                            deliveryDate: orderDetails[2],
                            deliveryTime: orderDetails[3],
                            orderAddress: orderDetails[4],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
