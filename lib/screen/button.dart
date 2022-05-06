import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Image(image: AssetImage('images/ben10.jpg')),
          height: 25,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
        ),
      ),
    );
  }
}
