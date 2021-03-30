import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_example/screens/Login/components/loginbody.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
      resizeToAvoidBottomInset: false, // set it to false
    );
  }
}
