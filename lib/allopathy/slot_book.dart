import 'package:flutter/material.dart';

import 'package:tnshealth/allopathy/stateless_page.dart';

class SlotBook extends StatefulWidget {
  const SlotBook({Key? key}) : super(key: key);

  @override
  State<SlotBook> createState() => _SlotBook();
}

class _SlotBook extends State<SlotBook> {
  String? text1;
  String? text2;

  String? _selectedDate;

  dynamic _selectedSlot;

  bool _isSlotAvailable = false;

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var slotList = <String, dynamic>{
      '01/05/2022': generateRandomSlots(4),
      '02/05/2022': generateRandomSlots(2),
      '03/05/2022': generateRandomSlots(6),
      '04/05/2022': [],
      '05/05/2022': generateRandomSlots(7),
      '06/05/2022': generateRandomSlots(5),
      '07/05/2022': [],
      '08/05/2022': generateRandomSlots(2),
      'More...': [],
    };
    var slotList2 = <String, dynamic>{
      '23/05/2022': generateRandomSlots(7),
      '25/05/2022': generateRandomSlots(4),
      '26/05/2022': generateRandomSlots(2),
      '30/05/2022': generateRandomSlots(6),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('select slots'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(
                    name: 'Dr. R Manjunath',
                    place: 'Manipal Hospital,Jayanagar 9 block'),
                const SizedBox(height: 20),
                const Divider(
                  color: Color.fromARGB(14, 0, 0, 0),
                  height: 30,
                  thickness: 2,
                  indent: 2,
                  endIndent: 2,
                ),
                const ConsultationPage(
                    title: 'Purpose of visit', consult: 'Consultation'),
                const SizedBox(height: 10),
                Container(
                  height: 80,
                  width: 800,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 240, 239, 239)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: slotList.length,
                      itemBuilder: (context, index) {
                        //print(slotList.keys.toList()[index]);
                        return GestureDetector(
                          onTap: () {
                            if (slotList.values.toList()[index].isNotEmpty) {
                              setState(
                                () {
                                  _isSlotAvailable = true;
                                },
                              );
                              _selectedDate = slotList.keys.toList()[index];
                              //ignore: avoid_print
                              print(_selectedDate);
                              // ignore: unrelated_type_equality_checks

                              _selectedSlot = slotList.values.toList()[index];
                              // ignore: avoid_print
                              print(_selectedSlot);
                            } else if (slotList.keys.toList()[index] ==
                                'More...') {
                              _selectDates(context);
                            } else {
                              setState(() {
                                _isSlotAvailable = false;
                                _selectedDate = slotList.keys.toList()[index];
                              });
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 2, right: 5),
                            height: 5,
                            width: 120,
                            decoration: BoxDecoration(
                              color: slotList.keys.toList()[index] == 'More...'
                                  ? const Color.fromARGB(255, 8, 127, 163)
                                  : Colors.white,
                              border: Border.all(
                                  width: 1.5,
                                  color: slotList.values
                                              .toList()[index]
                                              .isEmpty &&
                                          slotList.keys.toList()[index] !=
                                              'More...'
                                      ? const Color.fromARGB(183, 224, 63, 51)
                                      : slotList.keys.toList()[index] ==
                                              'More...'
                                          ? const Color.fromARGB(
                                              255, 8, 127, 163)
                                          : const Color.fromARGB(
                                              255, 68, 236, 76)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: slotList.keys.toList()[index] == 'More...'
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        slotList.keys.toList()[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Product Sans',
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        slotList.keys.toList()[index],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Product Sans',
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        slotList.keys.toList()[index] ==
                                                'More...'
                                            ? ''
                                            : '${slotList.values.toList()[index].length} Slots available',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Product Sans',
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _isSlotAvailable
                    ? Column(
                        children: [
                          Text(
                            '$_selectedDate',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GridView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            shrinkWrap: true,
                            itemCount: _selectedSlot.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 5, top: 20, bottom: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          211, 16, 96, 161),
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, top: 10, right: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          _selectedSlot[index].toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Product Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            '$_selectedDate',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('No slots available'),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectDates(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022, 05, 01),
      lastDate: DateTime(2022, 06, 30),
      helpText: 'choose your slot',
    );
    if (selectedDate == selected) {
      generateRandomSlots(7);
    }
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;

        // ignore: avoid_print
        print(selectedDate);
      });
    }
  }
}
