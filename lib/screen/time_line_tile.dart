// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineTile extends StatefulWidget {
  const TimeLineTile({Key? key}) : super(key: key);

  @override
  State<TimeLineTile> createState() => _TimeLineTileState();
}

class _TimeLineTileState extends State<TimeLineTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimelineTile(
              indicatorStyle: IndicatorStyle(
                color: Colors.red,
                height: 30,
                width: 30,
                iconStyle: IconStyle(iconData: Icons.smart_button),
              ),
              // isFirst: true,
              // isLast: true,
              beforeLineStyle: LineStyle(
                  color: Color.fromARGB(255, 36, 32, 1), thickness: 2),
              // afterLineStyle: LineStyle(
              //     color: Color.fromARGB(255, 36, 32, 1), thickness: 2),
              alignment: TimelineAlign.center,
              endChild: Container(
                height: 40,
                // width: 10,
                color: Colors.purple,
              ),
              startChild: Container(
                height: 40,
                // width: 10,
                color: Color.fromARGB(255, 239, 235, 240),
              ),
              hasIndicator: true,
            ),
          ],
        ),
      ),
    );
  }
}
