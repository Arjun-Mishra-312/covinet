import 'package:covinet/News/news.dart';
import 'package:covinet/Screens/MessageScreen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main screen"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MessageScreen()));
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                height: 200,
                width: 200,
                child: Center(child: Text("Messaging")),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NewsScreen()));
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                height: 200,
                width: 200,
                child: Center(child: Text("NEWS")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
