import 'package:flutter/material.dart';

class Allopathy extends StatefulWidget {
  const Allopathy({Key? key}) : super(key: key);

  @override
  _AllopathyState createState() => _AllopathyState();
}

class _AllopathyState extends State<Allopathy> {
  final kTabBar = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final searchBar = TextFormField(
    // keyboardType: TextInputType.none,
    autofocus: false,

    onSaved: (value) {},
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      prefixIcon: const Icon(Icons.search),
      hintText: "Search Symptoms/Specialities",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Allopathy'),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                'Specialities most relevant to you',
                style: kTabBar,
              ),
              Wrap(
                spacing: 25.0, // gap between adjacent chips
                runSpacing: 20.0, //
                children: <Widget>[
                  FloatingActionButton(
                      heroTag: '1',
                      child: const Image(image: AssetImage('images/ben10.jpg')),
                      onPressed: () {}),
                  FloatingActionButton(
                      heroTag: '2',
                      child: const Image(image: AssetImage('images/ben10.jpg')),
                      onPressed: () {}),
                  FloatingActionButton(
                      heroTag: '3',
                      child: const Image(image: AssetImage('images/ben10.jpg')),
                      onPressed: () {}),
                  FloatingActionButton(
                      heroTag: '4',
                      child: const Image(image: AssetImage('images/ben10.jpg')),
                      onPressed: () {}),
                  FloatingActionButton(
                      heroTag: '5',
                      child: const Image(image: AssetImage('images/ben10.jpg')),
                      onPressed: () {}),
                  FloatingActionButton(
                      heroTag: '6',
                      child: const Image(image: AssetImage('images/ben10.jpg')),
                      onPressed: () {}),
                  FloatingActionButton(
                      heroTag: '7',
                      child: const Image(image: AssetImage('images/ben10.jpg')),
                      onPressed: () {}),
                  FloatingActionButton(
                      heroTag: '8',
                      child: const Image(image: AssetImage('images/ben10.jpg')),
                      onPressed: () {}),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  Container();
                },
                child: const Text('View All Specialities'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
