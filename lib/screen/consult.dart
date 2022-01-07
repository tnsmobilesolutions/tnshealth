import 'package:flutter/material.dart';
import 'package:tnshealth/allopathy/allopathy.dart';
import 'package:tnshealth/ayurvedic/ayurvedic.dart';
import 'package:tnshealth/homeopathy/homeopathy.dart';

class Consult extends StatefulWidget {
  Consult({Key? key}) : super(key: key);

  @override
  _ConsultState createState() => _ConsultState();
}

class _ConsultState extends State<Consult> {
  final kTextStyle = const TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.red),
            height: 70.0,
            width: 300.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Allopathy();
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Allopathy',
                    style: kTextStyle,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.greenAccent),
            height: 70.0,
            width: 300.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Ayurvedic();
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Ayurvedic',
                    style: kTextStyle,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            height: 70.0,
            width: 300.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Homeopathy();
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Homeopathy',
                    style: kTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
