
import 'package:covinet/Screens/HomePage/Tabs/GetTestingLocations.dart';

import 'package:covinet/Screens/MessageScreen.dart';

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
          title: Text("Covinet"),
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
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Center(
              child: PersonalInfo(),
            ),
            Center(
              child: MessageScreen(),
            ),
            Center(
              child: GetTestingLocations(),
            ),
          ],
        ),
        
      ),
    );
  }
}
