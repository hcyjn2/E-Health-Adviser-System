import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_example/screens/Welcome/components/welcomebody.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
