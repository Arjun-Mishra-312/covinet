import 'dart:html';

import 'package:covinet/Screens/HomePage/Tabs/AddTest.dart';
import 'package:covinet/Screens/HomePage/Tabs/TestTable.dart';
import 'package:flutter/material.dart';

import 'AddLocation.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => new _PersonalInfoState();
}

class _PersonalInfoState extends State {
  Map<String, dynamic> userFormData = {
    'name': '',
    'date': '',
    'location': '',
    'description': '',
    'isPositive': '',
  };
  List<Map<String, dynamic>> _data = [
    {
      'name': 'RiteAids',
      'date': '09/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Walmart',
      'date': '80/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Walmart',
      'date': '07/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
    {
      'name': 'Kaiser',
      'date': '10/20/2021',
      'location': '123 Test Street',
      'description': 'good',
      'isPositive': 'no'
    },
  ];

  void _setLocation(List<int> coords) {
    setState(() {
      userFormData['location'] = coords;
    });
  }

  void _setFormData(String key, String val) {
    setState(() {
      userFormData[key] = val;
    });
  }

  void _Submit() {
    print(userFormData);
    _data.add(userFormData);
    setState(() {});
    Navigator.pop(context);
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
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
                height: 300,
                child: TestTable(
                  data: _data,
                )),
          )),
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
