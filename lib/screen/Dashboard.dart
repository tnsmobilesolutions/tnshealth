import 'package:flutter/material.dart';

import 'package:tnshealth/screen/navigationdrawer.dart';
import 'package:tnshealth/screen/tabbar/consult.dart';
import 'package:tnshealth/screen/tabbar/diagnosis.dart';
import 'package:tnshealth/screen/tabbar/medicine.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final kTextStyle = const TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: const Text('Home'),

          // ignore: prefer_const_constructors
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Consult',
                  style: kTabBar,
                ),
              ),
              Tab(
                child: Text(
                  'Diagnosis',
                  style: kTabBar,
                ),
              ),
              Tab(
                child: Text(
                  'Medicine',
                  style: kTabBar,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [Consult(), Diagnosys(), Medicine()]),
      ),
    );
  }
}
