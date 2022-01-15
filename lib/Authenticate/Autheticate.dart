import 'package:covinet/Authenticate/LoginScree.dart';
import 'package:covinet/Screens/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return MainScreen();
    } else {
      return LoginScreen();
    }
  }
}
