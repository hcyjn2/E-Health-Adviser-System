import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_example/screens/Welcome/welcomescreen.dart';
import 'package:flutter_firebase_login_example/utils_login/constants.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //this is when your page is pre-loaded then call this function
  //can put any function that you want to run at first when page is ready


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SEGP11A',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: const Color(0xFFF5F5EF),
      ),
      home: WelcomeScreen(),
    );
  }
}
