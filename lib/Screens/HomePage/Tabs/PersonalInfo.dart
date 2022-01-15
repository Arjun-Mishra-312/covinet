import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);
  static const int row = 4;
  static const int col = 3;
  @override
  Widget build(BuildContext context) {
    bool pressed;
    return Scaffold(
        body: Column(children: <Widget>[
          const Text("Your Testing Locations"),
          const Text("Are you infected with Covid in the past 14 Days?"),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(onPressed: null, child: const Text('Yes')),
                TextButton(onPressed: null, child: const Text('No')),
              ]),
        ]),
        floatingActionButton: FloatingActionButton(
            //For adding more tests
            onPressed: null,
            child: const Icon(Icons.add)));
  }
}
