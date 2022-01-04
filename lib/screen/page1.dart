import 'package:flutter/material.dart';
import 'package:tnshealth/constants.dart';

class page1 extends StatefulWidget {
  page1({Key? key}) : super(key: key);

  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(child: Text('TNS-HEALTH')),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              child: Center(child: kCircle),
            ),
            // Expanded(child: Center(child: kIdContainer)),
            // Expanded(child: Center(child: kPasswordContainer)),
            // Expanded(child: kSignContainer)
          ],
        )),
      ),
    );
  }
}
