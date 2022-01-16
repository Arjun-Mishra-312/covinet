import 'dart:html';

import 'package:covinet/Screens/HomePage/Tabs/AddLocation.dart';
import 'package:covinet/Screens/HomePage/Tabs/AddTest.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => new _PersonalInfoState();
}

class _PersonalInfoState extends State {
  Map<String, dynamic> userFormData = {
    'Name': '',
    'Date': '',
    'isPositive': '',
    'Location': [],
    'Description': ''
  };

  void _setLocation(List<int> coords) {
    setState(() {
      userFormData['Location'] = coords;
    });
  }

  void _setFormData(String key, String val) {
    setState(() {
      userFormData[key] = val;
    });
  }

  void _Submit() {
    print(userFormData);
    //TODO implement submission
  }

  void _opennewpage() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text("Add New Test")),
        body: new Column(
          children: [
            AddLocation(setLoc: _setLocation),
            AddTest(setData: _setFormData, submit: _Submit),
          ],
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10.0),
              child: const Text(
                "Your Previous Tests",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              )),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: const Text(
                "You have no previous tests",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.left,
              )),
          Expanded(child: Container()),
          const Text("Have you tested positive for Covid in the past 14 Days?",
              style: TextStyle(fontSize: 15)),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
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
                ]),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            //For adding more tests
            onPressed: _opennewpage,
            child: const Icon(Icons.add)));
  }
}
