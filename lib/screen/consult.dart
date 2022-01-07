import 'package:flutter/material.dart';
import 'package:tnshealth/allopathy/allopathy.dart';
import 'package:tnshealth/ayurvedic/ayurvedic.dart';
import 'package:tnshealth/homeopathy/homeopathy.dart';

class Consult extends StatefulWidget {
  const Consult({Key? key}) : super(key: key);

  @override
  _ConsultState createState() => _ConsultState();
}

class _ConsultState extends State<Consult> {
  final kConsultTextstyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 45,
      backgroundColor: Colors.black,
      color: Colors.redAccent);
  final kTextStyle = const TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Allopathy();
                    },
                  ));
                },
                child: Text(
                  'Allopathy',
                  style: kConsultTextstyle,
                )),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Ayurvedic();
                    },
                  ));
                },
                child: Text('Ayurvedic', style: kConsultTextstyle)),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Homeopathy();
                    },
                  ));
                },
                child: Text(
                  'Homeopathy',
                  style: kConsultTextstyle,
                )),
          ),
        ],
      ),
    );
  }
}
