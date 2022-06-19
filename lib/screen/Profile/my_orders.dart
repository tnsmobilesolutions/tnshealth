// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:healthshared/healthshared.dart';
import 'package:tnshealth/screen/Profile/order_details.dart';

class MyOrders extends StatefulWidget {
  MyOrders({Key? key, required this.myAllOrders}) : super(key: key);
  List<Order>? myAllOrders;
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Center(
        child: SafeArea(
          child: widget.myAllOrders != null
              ? ListView.builder(
                  itemCount: widget.myAllOrders?.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: ListTile(
                          tileColor: Color.fromARGB(255, 186, 210, 255),
                          //visualDensity: VisualDensity(vertical: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                  'Customer Name : ${widget.myAllOrders?[index].name}'),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                  'Order Id :  ${widget.myAllOrders?[index].orderId}'),
                              Text(
                                  'Order Date :  ${widget.myAllOrders?[index].orderDate}'),
                              Text(
                                  'Order Time :  ${widget.myAllOrders?[index].orderTime}'),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderDetails(order: widget.myAllOrders?[index]),
                          ),
                        );
                      },
                    );
                  }),
                )
              : Text('No oredrs to show'),
        ),
      ),
    );
  }
}
