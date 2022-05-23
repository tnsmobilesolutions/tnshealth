import 'package:flutter/material.dart';

import 'package:tnshealth/allopathy/stateless_page.dart';

class SlotBook extends StatefulWidget {
  const SlotBook({Key? key}) : super(key: key);

  @override
  State<SlotBook> createState() => _SlotBook();
}

class _SlotBook extends State<SlotBook> {
  DateTime selectedDate = DateTime.now();
  var selectedDateFromCalender;
  String? text1;
  String? text2;

  bool _isDateSelected = false;
  bool _isSlotAvailable = false;
  String? _selectedDate;
  dynamic _selectedSlot;

  Future<DateTime> _selectDates(BuildContext context) async {
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
      setState(
        () {
          selectedDate = selected;

          //print(selectedDate);
        },
      );
    }
    return selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    Map slotList1 = <String, List<String>>{
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
    Map slotList2 = <String, List<String>>{
      '2022-05-23 00:00:00.000': generateRandomSlots(3),
      '2022-05-25 00:00:00.000': generateRandomSlots(4),
      '2022-05-27 00:00:00.000': generateRandomSlots(2),
      '2022-05-29 00:00:00.000': generateRandomSlots(6),
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
                      itemCount: slotList1.length,
                      itemBuilder: (context, index) {
                        //print(slotList1.keys.toList()[index]);
                        return GestureDetector(
                          onTap: () async {
                            if (slotList1.values.toList()[index].isNotEmpty) {
                              setState(
                                () {
                                  _isSlotAvailable = true;
                                },
                              );
                              _selectedDate = slotList1.keys.toList()[index];
                              _selectedSlot = slotList1.values.toList()[index];
                            } else if (slotList1.keys.toList()[index] ==
                                'More...') {
                              selectedDateFromCalender =
                                  await _selectDates(context);

                              setState(
                                () {
                                  _isSlotAvailable = false;
                                  _isDateSelected = true;
                                },
                              );
                              _selectedSlot = slotList2.values.toList()[0];
                            } else {
                              setState(
                                () {
                                  _isSlotAvailable = false;
                                  _isDateSelected = false;
                                  _selectedDate =
                                      slotList1.keys.toList()[index];
                                },
                              );
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 2, right: 5),
                            height: 5,
                            width: 120,
                            decoration: BoxDecoration(
                              color: slotList1.keys.toList()[index] == 'More...'
                                  ? const Color.fromARGB(255, 8, 127, 163)
                                  : Colors.white,
                              border: Border.all(
                                  width: 1.5,
                                  color: slotList1.values
                                              .toList()[index]
                                              .isEmpty &&
                                          slotList1.keys.toList()[index] !=
                                              'More...'
                                      ? const Color.fromARGB(183, 224, 63, 51)
                                      : slotList1.keys.toList()[index] ==
                                              'More...'
                                          ? const Color.fromARGB(
                                              255, 8, 127, 163)
                                          : const Color.fromARGB(
                                              255, 68, 236, 76)),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: slotList1.keys.toList()[index] == 'More...'
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        slotList1.keys.toList()[index],
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
                                        slotList1.keys.toList()[index],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Product Sans',
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        slotList1.keys.toList()[index] ==
                                                'More...'
                                            ? ''
                                            : '${slotList1.values.toList()[index].length} Slots available',
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
                _isSlotAvailable || _isDateSelected
                    ? Column(
                        children: [
                          Text(
                            _isSlotAvailable
                                ? '$_selectedDate'
                                : '$selectedDateFromCalender',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GridView.builder(
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
                                            fontSize: 15,
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
}
