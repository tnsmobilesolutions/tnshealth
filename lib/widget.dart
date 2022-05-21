import 'package:flutter/material.dart';

class Widgets {
  Widget myOrders(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text1,
        ),
        Expanded(
          child: Text(
            text2,
          ),
        ),
      ],
    );
  }
}
