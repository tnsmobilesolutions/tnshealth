// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:healthshared/models/order_model.dart';
import 'package:photo_view/photo_view.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key? key, this.order}) : super(key: key);
  Order? order;
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String prescriptionUrl = '';
  @override
  void initState() {
    super.initState();
    prescriptionUrl = widget.order?.prescriptionURL as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Customer Name : '),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.order?.name}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Order Id : ',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.order?.orderId}',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Order Date : ',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.order?.orderDate}',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Order Time : ',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.order?.orderTime}',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Payment Status : ',
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${widget.order?.paymentStatus}',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Address : ',
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Patient Name : '),
                              Expanded(
                                child: Text(
                                  '${widget.order?.address?.patientName}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                              'Address ID : ${widget.order?.address?.addressId}'),
                          SizedBox(height: 10),
                          Text(
                              'Contact No. : ${widget.order?.address?.phoneNumber}'),
                          SizedBox(height: 10),
                          Text(
                              'Address Type : ${widget.order?.address?.addressType}'),
                          SizedBox(height: 10),
                          Text('City : ${widget.order?.address?.city}'),
                          SizedBox(height: 10),
                          Text('Sate : ${widget.order?.address?.state}'),
                          SizedBox(height: 10),
                          Text('${widget.order?.address?.addressLine1}'),
                          SizedBox(height: 10),
                          Text('${widget.order?.address?.addressLine2}'),
                          SizedBox(height: 10),
                          Text('Pincode : ${widget.order?.address?.pincode}'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                //
                FullScreenWidget(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.height,
                    child: PhotoView(
                      backgroundDecoration: BoxDecoration(
                          //color: CustomColor.black,
                          borderRadius: BorderRadius.circular(10)),
                      imageProvider: NetworkImage(prescriptionUrl),
                    ),
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
