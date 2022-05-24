import 'package:flutter/material.dart';
import 'package:tnshealth/model/addressmodel.dart';
import 'package:tnshealth/model/ordermodel.dart';

import 'order_details.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Order> orderDetails = [
    Order(
      orderId: '123',
      deliveryDate: '26/05/2022',
      deliveryTime: '05.00 PM',
      orderDate: '25/05/2022',
      orderTime: '08.00 PM',
      userId: 'abc',
      vendorId: 'ABCD',
      prescriptionURL: 'abababab',
      orderAddress: Address(
        addressId: '456',
        addressLine1: 'Plot - 626 / 979',
        addressLine2: 'AT - Naharkanta, PO - Balianta, PS - Hanshpal',
        addressNickName: 'Home',
        city: 'Bhubaneswar',
        contactNumber: 7008183804,
        pincode: 752101,
        state: 'Odisha',
      ),
    ),
    Order(
      orderId: '456',
      deliveryDate: '26/05/2022',
      deliveryTime: '05.00 PM',
      orderDate: '25/05/2022',
      orderTime: '08.00 PM',
      userId: 'abc',
      vendorId: 'ABCD',
      prescriptionURL: 'abababab',
      orderAddress: Address(
        addressId: '456',
        addressLine1: 'Plot - 626 / 979',
        addressLine2: 'AT - Naharkanta, PO - Balianta, PS - Hanshpal',
        addressNickName: 'Home',
        city: 'Bhubaneswar',
        contactNumber: 7008183804,
        pincode: 752101,
        state: 'Odisha',
      ),
    ),
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
                itemCount: orderDetails.length,
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
                        title: Text(orderDetails[index].orderId ?? ''),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderDetails(order: orderDetails[index]),
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
