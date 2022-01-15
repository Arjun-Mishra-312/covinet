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
          const Text(
            "Your Previous Tests",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.left,
          ),
          Expanded(child: Container()),
          const Text("Have you tested positive for Covid in the past 14 Days?",
              style: TextStyle(fontSize: 15)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                    onPressed: () {
                      print("Yes");
                    },
                    style: OutlinedButton.styleFrom(primary: Colors.green),
                    child: const Text('Yes')),
                OutlinedButton(
                    onPressed: () {
                      print("No");
                     },
                    style: OutlinedButton.styleFrom(primary: Colors.red),
                    child: const Text('No')),
              ]
            ),
        ]),
        floatingActionButton: FloatingActionButton(
            //For adding more tests
            onPressed: null,
            child: const Icon(Icons.add)));
  }
}
