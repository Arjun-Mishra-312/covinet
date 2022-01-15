import 'package:flutter/material.dart';

class AddTest extends StatelessWidget{
  const AddTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25),
                child: const Text("Name")
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: 
                  TextField(
                    obscureText: true,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name:'
                    ),
                  ),
                )
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(25),
                  child: const Text("Date:")
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    obscureText: true,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'MM/DD/YYYY'
                    ),
                  ),
                )
              )
            ],
          )
        ],
      )
    );
  }
}