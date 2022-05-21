import 'dart:math';

import 'package:flutter/material.dart';

class ConsultationPage extends StatelessWidget {
  final String title;
  final String consult;

  const ConsultationPage({
    Key? key,
    required this.title,
    required this.consult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Product Sans',
                fontSize: 15,
              ),
            ),
            Text(
              consult,
              style: const TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 13,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String name;
  final String place;
  const Header({
    Key? key,
    required this.name,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.grey,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Product Sans',
                fontSize: 17,
              ),
            ),
            Text(
              place,
              style: const TextStyle(
                fontFamily: 'Product Sans',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

List<String> generateRandomSlots(int length) {
  final random = Random();
  const availableChars = [
    '07:00 AM',
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '03:00 PM',
    '04:00 PM'
  ];
  final randomString = List.generate(
      length, (index) => availableChars[random.nextInt(availableChars.length)]);

  return randomString;
}
