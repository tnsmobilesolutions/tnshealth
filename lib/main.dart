import 'package:flutter/material.dart';
import 'package:tnshealth/screen/page1.dart';

void main() {
  runApp(const tnshealth());
}

class tnshealth extends StatelessWidget {
  const tnshealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return page1();
  }
}
