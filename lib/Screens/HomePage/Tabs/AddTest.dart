import 'package:covinet/Screens/HomePage/Tabs/AddLocation.dart';
import 'package:flutter/material.dart';

class AddTest extends StatelessWidget {
  const AddTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 356,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(25), child: const Text("Name")),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Name:'),
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(25), child: const Text("Date:")),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'MM/DD/YYYY'),
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(25), child: const Text("Location")),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Location'),
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(25),
                    child: const Text("Positive or Negative:")),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Yes/No'),
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      // if (_formKey.currentState.validate()) {
                      //   _formKey.currentState.save();
                      // }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
