import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Allopathy extends StatefulWidget {
  const Allopathy({Key? key}) : super(key: key);

  @override
  _AllopathyState createState() => _AllopathyState();
}

class _AllopathyState extends State<Allopathy> {
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Allopathy'),
      ),
      body: Container(
        child: SfDateRangePicker(
          onSelectionChanged: _onSelectionChanged,
          selectionMode: DateRangePickerSelectionMode.range,
        ),
      ),
    );
  }
}
