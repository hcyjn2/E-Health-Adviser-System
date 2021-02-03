import 'package:flutter/material.dart';
import 'package:main_menu/Screens/Login/components/loginbody.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: LoginBody(),
        resizeToAvoidBottomInset: false, // set it to false
    );
  }
}
