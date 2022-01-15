import 'dart:io';

import 'package:covinet/Screens/HomePage/Tabs/NearbyTesters.dart';
import 'package:flutter/material.dart';
import 'Tabs/PersonalInfo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("My Name"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Personal Info"),
              ),
              Tab(
                child: Text("Nearby Testers"),
              ),
              Tab(
                child: Text("Test Centers"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: PersonalInfo(),
            ),
            Center(
              child: Text("Nearby Testers"),
            ),
            Center(
              child: Text("Test Centers"),
            ),
          ],
        ),
      ),
    );
  }
}
