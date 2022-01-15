import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main screen"),
      ),
      body: GestureDetector(
        onTap: () {
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(20)),
            height: 200,
            width: 200,
            child: Center(child: Text("Messaging")),
          ),
        ),
      ),
    );
  }
}
