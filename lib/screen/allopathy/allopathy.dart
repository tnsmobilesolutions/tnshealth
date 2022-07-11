import 'package:flutter/material.dart';
import 'package:tnshealth/constants.dart';
import 'package:tnshealth/screen/button.dart';

class Allopathy extends StatefulWidget {
  const Allopathy({Key? key}) : super(key: key);

  @override
  _AllopathyState createState() => _AllopathyState();
}

class _AllopathyState extends State<Allopathy> {
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final List _button = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    Widget specialities() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.amber,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ElevatedButton(
            style: kbuttonshape,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  kCircle20,
                  Text('Eleveted Button'),
                  Icon(Icons.forward)
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text('Allopathy'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  'Specialities most relevant to you',
                  style: kTabBar,
                ),
                Container(
                  height: 200,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: _button.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return const CircularButton();
                        }),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                            itemCount: _button.length,
                            itemBuilder: (BuildContext context, int index) {
                              return specialities();
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('View All Specialities'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
