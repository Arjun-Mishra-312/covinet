import 'package:covinet/Screens/HomePage/Tabs/AddLocation.dart';
import 'package:flutter/material.dart';

class AddTest extends StatelessWidget {
  final Function setData;
  final Function submit;
  const AddTest({Key? key, required this.setData, required this.submit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 356,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Row(
            //   children: <Widget>[
            //     Padding(padding: EdgeInsets.all(25), child: const Text("name")),
            //     Flexible(
            //         child: Padding(
            //       padding: EdgeInsets.all(30),
            //       child: TextField(
            //         obscureText: false,
            //         decoration: InputDecoration(
            //             border: OutlineInputBorder(), labelText: 'name:'),
            //         onChanged: (value) => setData('name', value),
            //       ),
            //     ))
            //   ],
            // ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(25), child: const Text("date:")),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'MM/DD/YYYY'),
                    onChanged: (value) => setData('date', value),
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(25),
                    child: const Text("description")),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'description'),
                    onChanged: (value) => setData('description', value),
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(25),
                    child: const Text("Positive?:")),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Yes/No'),
                    onChanged: (value) => setData('isPositive', value),
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
                      submit();
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
